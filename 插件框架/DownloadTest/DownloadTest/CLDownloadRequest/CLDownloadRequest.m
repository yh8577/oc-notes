//
//  CLDownloadRequest.m
//  CLBrowser
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import "CLDownloadRequest.h"
#import "CLDownloadManager.h"
#import <CommonCrypto/CommonDigest.h>


@interface DownloadPathUtils : NSObject
+ (NSString *)downloadTmpPath;
+ (NSString *)downloadPath;
+ (NSString *)resumeDatatTmpPath;
+ (NSString *)cachedFileNameForKey:(NSString *)key;

@end
@implementation DownloadPathUtils
+ (void)checkFilePath:(NSString *)path
{
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if (!(isDir && existed)) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
/**
 * 默认下载临时路径
 **/
+ (NSString *)downloadTmpPath
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [documentPaths objectAtIndex:0];
    NSString *tmpPath = [docsDir stringByAppendingPathComponent:@"CLDownloadTmpFiles"];
    [DownloadPathUtils checkFilePath:tmpPath];
    return tmpPath;
}

/**
 * 默认下载路径
 **/
+ (NSString *)downloadPath
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [documentPaths objectAtIndex:0];
    NSString *savePath = [docsDir stringByAppendingPathComponent:@"CLDownload"];
    [DownloadPathUtils checkFilePath:savePath];
    return savePath;
}

/**
 * 获取app  tmp 目录
 **/
+ (NSString *)resumeDatatTmpPath
{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}


/**
 * 计算URL的MD5值作为缓存数据文件名
 **/
+ (NSString *)cachedFileNameForKey:(NSString *)key
{
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return filename;
}

@end

@interface CLDownloadRequest ()
@property (strong, nonatomic,readwrite) NSString *url;
@property (readwrite,nonatomic) NSMutableURLRequest *request;
@property (weak,nonatomic) CLDownloadManager *manager;
@property (strong, nonatomic,readwrite) NSData *resumeData;   //断点续传的Data(包含URL)
@end

@implementation CLDownloadRequest

- (void)dealloc
{
    CLog(@"dealloc -- CLDownloadRequest");
    self.delegate = nil;
    self.url = nil;
    self.request = nil;
    if (_httpMethod) {
        _httpMethod = nil;
    }
    if (_tempPath) {
        _tempPath = nil;
    }
    if (_savePath) {
        _savePath = nil;
    }
    self.saveFileName = nil;
    self.username = nil;
    self.password = nil;
    self.resumeData = nil;
    self.task = nil;
}
- (instancetype)initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        self.url = url;
        self.httpMethod = @"GET";
        [self doInit];
    }
    return self;
}

/**
 * 实例化请求对象 已经存在则返回 不存在则创建一个并返回
 **/
+ (CLDownloadRequest *)initWithURL:(NSString *)url
{
    CLDownloadRequest *request = [[CLDownloadManager downloadManagerInstance] requestForURL:url];
    if (!request) {
       request = [[CLDownloadRequest alloc] initWithURL:url];
    }
    return request;
}

- (NSURL *)requestUrl
{
    return [NSURL URLWithString:self.url];
}

- (void)setHttpMethod:(NSString *)httpMethod
{
    _httpMethod = httpMethod;
    self.request.HTTPMethod = httpMethod;
}

/**
 *设置请求头 目前暂未实现
 **/
- (void)setHeadInfo
{
    
}


- (void)doInit
{
    self.state = CLDownloadRequestState_None;
    self.manager = [CLDownloadManager downloadManagerInstance];
    self.request = [NSMutableURLRequest requestWithURL:[self requestUrl]];
    self.request.cachePolicy = NSURLRequestReloadRevalidatingCacheData;
//    self.request.timeoutInterval = 60;
    self.request.HTTPMethod = self.httpMethod;
    self.allowResume = NO;
    self.resumeData = [self readResumeData];
    [self setHeadInfo];
}

/**
 * 读取本地保存的文件下载断点位置信息数据
 **/
- (NSData *)readResumeData
{
    NSString *resumeDataPath = [[DownloadPathUtils resumeDatatTmpPath] stringByAppendingPathComponent:[DownloadPathUtils cachedFileNameForKey:self.url]];
    NSData *resume_Data = [NSData dataWithContentsOfFile:resumeDataPath];
    return resume_Data;
}

- (NSString *)tempPath
{
    if (!_tempPath) {
        _tempPath = [DownloadPathUtils downloadTmpPath];
    }
    return _tempPath;
}

-(NSString *)savePath
{
    if (!_savePath) {
        _savePath = [DownloadPathUtils downloadPath];
    }
    return _savePath;
}

/**
 *开始下载任务 适用于首次添加下载任务
 **/
- (void)startDownload
{
    [self.manager startRequestTask:self];
}

/**
 * 暂停下载任务
 * 注意初始化时allowResume 属性为YES 否则无效
 **/
- (void)pauseDownload
{
    if (!self.allowResume) {
        CLog(@"CLDownload ERROR: 当前设置的 allowResume 属性为 不支持断点续传, 如果需要请打开此属性");
        return;
    }
    if (self.state == CLDownloadRequestState_Pause) {
        CLog(@"CLDownload ERROR: 任务暂停失败 因为此任务本身处于暂停状态");
        return;
    }
    __weak typeof(self) wself = self;
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        // resumeData : 包含了继续下载的开始位置\下载的url
        wself.resumeData = resumeData;
        wself.task = nil;
        [wself.manager pauseRequest:wself];
        [wself resumeDatatWriteToFile];
    }];
    
}

//断点缓存数据写入文件
- (void)resumeDatatWriteToFile
{
    if (!self.resumeData) {
        CLog(@"ERROR resumeData 为空");
        return;
    }
    NSString *tmpPath = [[DownloadPathUtils resumeDatatTmpPath] stringByAppendingPathComponent:[DownloadPathUtils cachedFileNameForKey:self.url]];
    if (![self.resumeData writeToFile:tmpPath atomically:NO]) {
        CLog(@"ERROR resumeData 缓存数据写入失败");
    }
}

//移除断点缓存数据
- (void)deleteResumeDatat
{
    NSString *tmpPath = [[DownloadPathUtils resumeDatatTmpPath] stringByAppendingPathComponent:[DownloadPathUtils cachedFileNameForKey:self.url]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:tmpPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:tmpPath error:nil];
    }
}

/**
 * 恢复下载任务
 * 注意初始化时allowResume 属性为YES 否则无效
 **/
- (void)resumeDownload
{
    if (!self.allowResume) {
        CLog(@"CLDownload ERROR: 当前设置的 allowResume 属性为 不支持断点续传, 如果需要请打开此属性");
        return;
    }
    
    if (self.state != CLDownloadRequestState_Pause) {
        CLog(@"CLDownload ERROR: 任务恢复失败 因为此任务本身处于非暂停状态");
        return;
    }
    [self.manager startRequestTask:self];
    self.resumeData = nil;
}

/**
 * 取消下载任务
 **/
- (void)cancelDownload
{
    if (self.state == CLDownloadRequestState_Loading) {
        [self.task cancel];
    }
    [self.manager cancelRequest:self];
}

@end
