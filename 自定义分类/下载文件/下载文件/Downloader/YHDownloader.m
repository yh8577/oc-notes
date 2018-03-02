//
//  YHDownloader.m
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloader.h"

#define resumeDataPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"resumeData"]

@interface YHDownloader ()<NSURLSessionDownloadDelegate>
/** 下载任务 */
@property (nonatomic,strong)NSURLSessionDownloadTask *downloadTask;
/** 下载的数据信息 */
@property (nonatomic,strong)NSData *resumeData;
/** 下载的会话 */
@property (nonatomic,strong)NSURLSession *session;
// 暂停状态
@property(nonatomic,assign)BOOL isSuspend;

@property (nonatomic, strong) NSOutputStream *stream;

@end

@implementation YHDownloader

+ (instancetype)sharedDownloader {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (NSURLSession *)session {
    if (!_session) {

        //_session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        
        NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
        _session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier] delegate:self
                                            delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

- (NSData *)resumeData {
    if (!_resumeData) {
        NSData *resumeData = [NSData dataWithContentsOfFile:resumeDataPath];
        if (resumeData) {
            _resumeData = resumeData;
        } else {
            _resumeData = [NSData data];
        }
    }
    return _resumeData;
}

- (void)download:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    self.downloadTask = [self.session downloadTaskWithURL:url];
}

// 开始下载
- (void)startDownload:(NSString *)urlStr {
    
    if (!self.downloadTask) {
        NSLog(@"开始");
        self.isSuspend = YES;
        [self download:urlStr];
        [self.downloadTask resume];
    }
}

// 暂停下载
- (void)suspendDownload {

    if (self.isSuspend && self.downloadTask) {
        NSLog(@"暂停");
        self.isSuspend = NO;
        __weak typeof(self) weakSelf = self;
        [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            weakSelf.resumeData = resumeData;
        }];
    }
}
// 继续下载
- (void)continuetoDownload {
    
    if (!self.isSuspend && self.downloadTask) {
        NSLog(@"继续");
        self.isSuspend = YES;
        self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
        [self.downloadTask resume];
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    // 拼接保存文件地址
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    // 移动文件到地址
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
    NSLog(@"location = %@",location);
    self.downloadTask = nil;
    self.resumeData = nil;
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    //NSLog(@"%f",1.0 * totalBytesWritten / totalBytesExpectedToWrite);
    NSLog(@"%zd,%zd",totalBytesWritten,totalBytesExpectedToWrite);

    float progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if ([self.delegate respondsToSelector:@selector(YHDownloader:progress:)]) {
            [self.delegate YHDownloader:self progress:progress];
        }
    }];
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
    
    
}

- (void)URLSession:(nonnull NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    if (!error) {
        self.session = nil;
    }
}



@end
