//
//  YHSessionDownload.m
//  Session-断点续传
//
//  Created by jyh on 2018/3/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHSessionDownload.h"
@interface YHSessionDownload()<NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSData *resumeData;

@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, strong) NSMutableDictionary *downloadCache;
@property (nonatomic, copy) void (^successBlock) (BOOL);
@property (nonatomic, copy) void (^progressBlock) (float);
@property (nonatomic, copy) void (^errorBlock) (NSError*);
@end


@implementation YHSessionDownload

+ (instancetype)sharedDownloader {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (NSMutableDictionary *)downloadCache {
    if (!_downloadCache) {
        _downloadCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _downloadCache;
}

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        // 注意点:如果下载之后要更新 ui 那么就在主队列. 反之可以在子队列
    }
    return _session;
}

+ (void)start:(NSString *)urlStr successBlock:(void(^)(BOOL isSuccess))successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error))errorBlock{
    YHSessionDownload *download = [YHSessionDownload sharedDownloader];
    if (download.downloadCache[urlStr]) {
        return;
    }
    [download.downloadCache setObject:download forKey:urlStr];
    download.successBlock = successBlock;
    download.progressBlock = progressBlock;
    download.errorBlock = errorBlock;
    download.urlStr = urlStr;
    [download download];
}

+ (void)pause {
    YHSessionDownload *download = [YHSessionDownload sharedDownloader];
    [download.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        download.resumeData = resumeData;
        [download.resumeData writeToFile:[download tempFilePath] atomically:YES];
        download.downloadTask = nil;
    }];
}


+ (void)resume {
    
    YHSessionDownload *download = [YHSessionDownload sharedDownloader];
    if (download.downloadTask) {
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[download tempFilePath]]) {
        download.resumeData = [NSData dataWithContentsOfFile:[download tempFilePath]];
    }
    
    if (!download.resumeData) {
        return;
    }
    download.downloadTask = [download.session downloadTaskWithResumeData:download.resumeData];
    [download.downloadTask resume];
    download.resumeData = nil;
}


- (void)download {
//    @"http://127.0.0.1/031-34987-A.dmg"
    NSURL *url = [NSURL URLWithString:self.urlStr];
    self.downloadTask = [self.session downloadTaskWithURL:url];
    [self.downloadTask resume];
}

- (NSString *)tempFilePath {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[self.urlStr lastPathComponent]];
}

- (NSString *)saveFilePath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES).lastObject stringByAppendingPathComponent:[self.urlStr lastPathComponent]];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
        NSLog(@"下载完成: 文件地址%@",location);
        //NSLog(@"location = %@",[NSThread currentThread]);
        [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:[self saveFilePath] error:NULL];
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
    dispatch_sync(dispatch_get_main_queue(), ^{
        if (self.progressBlock) {
            self.progressBlock(progress);
        }
    });
    
    //NSLog(@"下载进度 %.02f%%", progress);
    //    NSLog(@"progress = %@",[NSThread currentThread]);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (!error) {
        if (self.successBlock) {
            self.successBlock(YES);
            [self.downloadCache removeObjectForKey:self.urlStr];
        }
    }
}

@end
