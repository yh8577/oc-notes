//
//  ViewController.m
//  Session-下载进度
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        //注意点: 主线程使用 mainQueue 子线程使用 new
    }
    return _session;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downloadTask];
}


- (void)downloadTask {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/031-34987-A.dmg"];
    
    NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithURL:url];
    
    [downloadTask resume];
    
    // 注意点: 使用代理方法不能使用回调对的方法
    
}


/**
 下载完成

 @param session NSURLSession
 @param downloadTask NSURLSessionDownloadTask
 @param location 临时文件保存路径
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"下载完成: 文件地址%@",location);
    NSLog(@"location = %@",[NSThread currentThread]);
    NSString *pathStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES).lastObject;
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/031-34987-A.dmg"];
    NSString *path = [pathStr stringByAppendingPathComponent:[url lastPathComponent]];
    [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:path error:NULL];
}


/**
 下载中

 @param session NSURLSession
 @param downloadTask NSURLSessionDownloadTask
 @param bytesWritten 写字节
 @param totalBytesWritten 写的总字节数
 @param totalBytesExpectedToWrite 预计写入的总字节数。
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
    
    NSLog(@"下载进度 %.02f%%", progress);
    NSLog(@"progress = %@",[NSThread currentThread]);
   
}


/**
 续传

 @param session NSURLSession
 @param downloadTask NSURLSessionDownloadTask
 @param fileOffset 文件偏移量
 @param expectedTotalBytes 预期的总字节数
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"续传");
    NSLog(@"续传 = %@",[NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}





@end
