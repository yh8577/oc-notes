//
//  YHDownloader.m
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloader.h"

@interface YHDownloader ()<NSURLSessionDownloadDelegate>
/** 下载任务 */
@property (nonatomic,strong)NSURLSessionDownloadTask *downloadTask;
/** 下载的数据信息 */
@property (nonatomic,strong)NSData *resumeData;
/** 下载的会话 */
@property (nonatomic,strong)NSURLSession *session;

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

- (NSData *)resumeData {
    if (!_resumeData) {
        _resumeData = [NSData data];
    }
    return _resumeData;
}

- (void)download:(NSString *)urlStr {
    
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];

    NSURL *url = [NSURL URLWithString:urlStr];
    
    self.downloadTask = [self.session downloadTaskWithURL:url];
    
}

- (void)startDownload:(NSString *)urlStr {
    [self download:urlStr];
    [self startDownload];
}

// 开始下载
- (void)startDownload {
    // 启动任务
    [self.downloadTask resume];
}
// 取消下载
- (void)suspentDownload {
    //    [self.downloadTask suspend];suspend暂停下载|可恢复的
    //cancelByProducingResumeData取消下载，同时可以获取已经下载的数据相关信息
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
    }];
   // NSLog(@"%s -- %@",__FUNCTION__,self.downloadTask);
}

// 继续下载
- (void)goOnDownload {
    NSURLSessionDownloadTask* downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    [downloadTask resume];
    self.downloadTask = downloadTask;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    // 拼接保存文件地址
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    // 移动文件到地址
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
    //NSLog(@"%@",fullPath);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    //NSLog(@"%f",1.0 * totalBytesWritten / totalBytesExpectedToWrite);
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
    NSLog(@"3 = session: %@,downloadTask: %@,fileOffset: %zd,expectedTotalBytes: %zd",session, downloadTask,fileOffset,expectedTotalBytes);
}

- (void)URLSession:(nonnull NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    NSLog(@"error = %@", error);
}


@end
