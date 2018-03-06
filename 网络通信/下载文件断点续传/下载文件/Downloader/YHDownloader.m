//
//  YHDownloader.m
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloader.h"

@interface YHDownloader ()<NSURLSessionDataDelegate>
/**
 下载任务
 */
@property (nonatomic,strong)NSURLSessionDataTask *dataTask;
/**
 下载的会话
 */
@property (nonatomic,strong)NSURLSession *session;
/**
 暂停状态
 */
@property(nonatomic,assign)BOOL isSuspend;
/**
 保存文件路径
 */
@property (nonatomic, copy) NSString *fullPath;
/**
 获得指定文件路径对应文件的数据大小
 */
@property (nonatomic, assign) NSInteger getFileSize;
/**
 请求头开始数据大小
 */
@property (nonatomic, assign) NSInteger currentSize;
/**
 文件句柄
 */
@property (nonatomic, strong) NSFileHandle *handle;
/**
 请求的数据大小
 */
@property (nonatomic, assign) NSInteger totalSize;
/**
 下载地址
 */
@property (nonatomic, strong) NSString *urlStr;

/**
 回调 Block
 */
@property (nonatomic, copy) void (^successBlock) (BOOL isSuccess);
@property (nonatomic, copy) void (^progressBlock) (float progress);
@property (nonatomic, copy) void (^errorBlock) (NSError *error);
@end

@implementation YHDownloader

/**
 单例

 @return  单例
 */
+ (instancetype)sharedDownloader {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

/**
  下载的会话

 @return  下载的会话
 */
- (NSURLSession *)session {
    if (!_session) {
//        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
        _session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier] delegate:self  delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

/**
  下载任务

 @return  下载任务
 */
- (NSURLSessionDataTask *)dataTask {

    if (!_dataTask) {
        NSLog(@"%@",[NSThread currentThread]);
        NSURL *url = [NSURL URLWithString:self.urlStr];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        //3 设置请求头信息,告诉服务器请求那一部分数据
        self.currentSize = [self getFileSize];
        [request setValue:[NSString stringWithFormat:@"bytes=%zd-",self.currentSize] forHTTPHeaderField:@"Range"];
        //4.创建Task
        _dataTask = [self.session dataTaskWithRequest:request];
    }
    return _dataTask;
}

/**
  保存文件路径

 @return  保存文件路径
 */
- (NSString *)fullPath {
    if (_fullPath == nil) {
        //获得文件全路径
        _fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self.urlStr lastPathComponent]];
    }
    return _fullPath;
}

/**
 获得指定文件路径对应文件的数据大小

 @return 获得指定文件路径对应文件的数据大小
 */
- (NSInteger)getFileSize {
    //获得指定文件路径对应文件的数据大小
    NSDictionary *fileInfoDict = [[NSFileManager defaultManager] attributesOfItemAtPath:self.fullPath error:nil];
    NSInteger currentSize = [fileInfoDict[@"NSFileSize"] integerValue];
    return currentSize;
}

/**
 开始下载

 @param urlStr 下载地址
 */
- (void)startDownload:(NSString *)urlStr successBlock:(void(^)(BOOL isSuccess))successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error))errorBlock {
    
    self.successBlock = successBlock;
    self.progressBlock = progressBlock;
    self.errorBlock = errorBlock;
    NSLog(@"开始");
    self.urlStr = urlStr;

    [self.dataTask resume];
}

/**
取消下载
 */
- (void)suspendDownload {

    NSLog(@"暂停");
    // 这里暂停不了,因为是断点续传用取消其实一样效果.
//    [self.dataTask suspend];
    // 只能用取消
    [self.dataTask cancel];
    self.dataTask = nil;
}

/**
 删除
 */
- (void)removeFileForKey:(NSString *)urlStr {
    [self suspendDownload];
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[urlStr lastPathComponent]];
    [[NSFileManager defaultManager] removeItemAtPath:fullPath error:nil];

}


#pragma mark NSURLSessionDataDelegate

/**
 *  1.接收到服务器的响应 它默认会取消该请求
 *
 *  @param session           会话对象
 *  @param dataTask          请求任务
 *  @param response          响应头信息
 *  @param completionHandler 回调 传给系统
 */
- (void)URLSession:(NSURLSession *)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    //获得文件的总大小
    //expectedContentLength 本次请求的数据大小
    self.totalSize = response.expectedContentLength + self.currentSize;
    
    if (response.expectedContentLength == -1) {
        if (self.successBlock) {
            self.successBlock(YES);
            float progress = 1.0 * self.currentSize / self.totalSize;
            self.progressBlock(progress);
        }
        return;
    }
    
    if (self.currentSize == 0) {
        //创建空的文件
        [[NSFileManager defaultManager]createFileAtPath:self.fullPath contents:nil attributes:nil];
    }
    //创建文件句柄
    self.handle = [NSFileHandle fileHandleForWritingAtPath:self.fullPath];

    //移动指针
    [self.handle seekToEndOfFile];
    /*
     NSURLSessionResponseCancel = 0,取消 默认
     NSURLSessionResponseAllow = 1, 接收
     NSURLSessionResponseBecomeDownload = 2, 变成下载任务
     NSURLSessionResponseBecomeStream        变成流
     */
    completionHandler(NSURLSessionResponseAllow);
}

/**
 *  接收到服务器返回的数据 调用多次
 *
 *  @param session           会话对象
 *  @param dataTask          请求任务
 *  @param data              本次下载的数据
 */

- (void)URLSession:(NSURLSession *)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    //写入数据到文件
    [self.handle writeData:data];
    //计算文件的下载进度
    self.currentSize += data.length;
    float progress = 1.0 * self.currentSize / self.totalSize;

    if (self.progressBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressBlock(progress);
        });
    }
}

/**
 *  请求结束或者是失败的时候调用
 *
 *  @param session           会话对象
 *  @param task              请求任务
 *  @param error             错误信息
 */

- (void)URLSession:(NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
//    NSLog(@"------%@",self.fullPath);
    //关闭文件句柄
    [self.handle closeFile];
    self.handle = nil;

    if (!error) {
        if (self.successBlock) {
            self.successBlock(YES);
        }
    } else {
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    }
}

- (void)dealloc {
    //清理工作
    //finishTasksAndInvalidate
    [self.session invalidateAndCancel];
}

@end
