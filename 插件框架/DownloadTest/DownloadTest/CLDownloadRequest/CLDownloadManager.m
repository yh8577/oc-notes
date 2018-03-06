//
//  CLDownloadManager.m
//  CLBrowser
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import "CLDownloadManager.h"
#import "CLDownloadRequest.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

@interface CLDownloadManager ()<NSURLSessionDelegate>
@property (strong, nonatomic) dispatch_queue_t downloadQueue;
@property (strong, nonatomic) NSMutableArray *taskList;
@property (strong, nonatomic) NSURLSession *defaultSession;
@end

static CLDownloadManager *downloadManager = nil;
@implementation CLDownloadManager
+ (CLDownloadManager *)downloadManagerInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloadManager = [[CLDownloadManager alloc] init];
    });
    return downloadManager;
}
- (CLDownloadRequest *)requestForURL:(NSString *)url
{
    CLDownloadRequest *req = nil;
    for (CLDownloadRequest *tmpRequest in self.taskList) {
        if ([tmpRequest.url isEqualToString:url]) {
            req = tmpRequest;
            break;
        }
    }
    return req;
}
- (void)dealloc {
    
    self.downloadQueue = nil;
    [self.taskList removeAllObjects];
    self.taskList = nil;
    self.defaultSession = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}
- (void)doInit
{
    self.downloadQueue = dispatch_queue_create("CLdownloadQueue", DISPATCH_QUEUE_SERIAL);
    self.taskList = [[NSMutableArray alloc] init];
}

-(NSURLSession*) defaultSession {
    
    static dispatch_once_t onceToken;
    static NSURLSessionConfiguration *defaultSessionConfiguration;
    static NSURLSession *defaultSession;
    dispatch_once(&onceToken, ^{
        defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        defaultSessionConfiguration.requestCachePolicy = NSURLRequestReloadRevalidatingCacheData;
//        defaultSessionConfiguration.timeoutIntervalForRequest = 120; //给定时间内没有数据传输的超时时间
//        defaultSessionConfiguration.timeoutIntervalForResource = 60; //给定时间内服务器查找资源超时时间
        defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration
                                                       delegate:self
                                                  delegateQueue:[NSOperationQueue mainQueue]];
    });
    
    return defaultSession;
}


#pragma mark-
#pragma mark- 控制下载队列数量
- (void)refreshDownloadTask
{
    __weak CLDownloadManager *wself = self;
    dispatch_async(self.downloadQueue, ^{
        CLDownloadManager *sself = wself;
        int startCount = 0;
        BOOL hasTaskRuning = NO;
        for (int i = 0; i < sself.taskList.count; i ++ ) {
            CLDownloadRequest *req = [sself.taskList objectAtIndex:i];
            if (req.state == CLDownloadRequestState_Loading) {
                startCount ++;
                hasTaskRuning = YES;
            }else if (req.state == CLDownloadRequestState_Wait) {
                req.state = CLDownloadRequestState_Loading;
                [req.task resume];
                startCount ++;
                hasTaskRuning = YES;
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([req.delegate respondsToSelector:@selector(requestDownloadStart:)]) {
                        [req.delegate requestDownloadStart:req];
                    }
                });
            }
            if (startCount >= maxConcurrentTaskCount) {
                break;
            }
        }
#ifdef TARGET_OS_IPHONE
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = hasTaskRuning;
        });
#endif
    });
}

/**
 * 添加下载任务/恢复下载任务
 **/
- (void)updateTaskListRequst:(CLDownloadRequest *)request
{
    __weak CLDownloadManager *wself = self;
    dispatch_async(self.downloadQueue, ^{
        CLDownloadManager *sself = wself;
        if ([sself.taskList containsObject:request]) {
            CLog(@"包含此下载请求..将其调整至任务队列最后");
            CLDownloadRequest *tmpRequest = request;
            [sself.taskList removeObject:request];
            [sself.taskList addObject:tmpRequest];
        }else {
            CLog(@"不包含此下载请求..将其加入任务队列中");
            [sself.taskList addObject:request];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [sself refreshDownloadTask];
        });
    });
}

/**
 *移除下载任务 条件如下
 * 1)下载完成
 * 2)下载失败
 **/
- (void)removeTasklistAtRequest:(CLDownloadRequest *)request
{
    if (!request) {
        return;
    }
    __weak CLDownloadManager *wself = self;
    dispatch_async(self.downloadQueue, ^{
        CLDownloadManager *sself = wself;
        [sself.taskList removeObject:request];
        dispatch_async(dispatch_get_main_queue(), ^{
            [sself refreshDownloadTask];
        });
    });
}

- (void)startRequestTask:(CLDownloadRequest *)request
{
    if(!request || !request.request) {
        CLog(@"CLDownload ERROR Request is nil, check your URL and other parameters you use to build your request");
        return;
    }
    NSURLSessionDownloadTask *task = nil;
    if (request.allowResume && request.resumeData) {
        task = [self.defaultSession downloadTaskWithResumeData:request.resumeData];
    }else {
        task = [self.defaultSession downloadTaskWithRequest:request.request];
    }
    request.task = task;
    request.state = CLDownloadRequestState_Wait;
    [self updateTaskListRequst:request];
}

/**
 * 暂停任务
 **/
- (void)pauseRequest:(CLDownloadRequest *)request
{
    request.state = CLDownloadRequestState_Pause;
    [self refreshDownloadTask];
    if ([request.delegate respondsToSelector:@selector(requestDownloadPause:)]) {
        [request.delegate requestDownloadPause:request];
    }
}
/**
 *取消下载任务
 **/
- (void)cancelRequest:(CLDownloadRequest *)request
{
    request.state = CLDownloadRequestState_Cancel;
    [request deleteResumeDatat];
    [self removeTasklistAtRequest:request];
    if ([request.delegate respondsToSelector:@selector(requestDownloadCancel:)]) {
        [request.delegate requestDownloadCancel:request];
    }
}
#pragma mark-
#pragma mark - NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    __block CLDownloadRequest *matchingRequest = nil;
    [self.taskList enumerateObjectsUsingBlock:^(CLDownloadRequest *request, NSUInteger idx, BOOL *stop) {
        if([request.task.currentRequest.URL.absoluteString isEqualToString:downloadTask.currentRequest.URL.absoluteString]) {
            matchingRequest = request;
            [request deleteResumeDatat]; //移除断点续传缓存数据文件
            request.savePath = [request.savePath stringByAppendingPathComponent:request.saveFileName];
            NSError *error = nil;
            if(![[NSFileManager defaultManager] moveItemAtPath:location.path toPath:request.savePath error:&error]) {
                CLog(@"CLDownload ERROR Failed to save downloaded file at requested path [%@] with error %@", request.savePath, error);
                if ([request.delegate respondsToSelector:@selector(requestDownloadFaild:aError:)]) {
                    [request.delegate requestDownloadFaild:request aError:error];
                }
            }else {
                if ([request.delegate respondsToSelector:@selector(requestDownloadFinish:)]) {
                    [request.delegate requestDownloadFinish:request];
                }
            }
            *stop = YES;
        }
    }];
    
    [self removeTasklistAtRequest:matchingRequest];
}



- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = (float)(((float)totalBytesWritten) / ((float)totalBytesExpectedToWrite));
    [self.taskList enumerateObjectsUsingBlock:^(CLDownloadRequest *request, NSUInteger idx, BOOL *stop) {
        if([request.task.currentRequest.URL.absoluteString isEqualToString:downloadTask.currentRequest.URL.absoluteString]) {
            if (request.progress > request.progress) {
                CLog(@"CLDownload ERROR 下载进度异常....");
            }
            if (!request.saveFileName || request.saveFileName.length <= 0) {
                request.saveFileName = downloadTask.response.suggestedFilename;
            }
            request.progress = progress;
            if ([request.delegate respondsToSelector:@selector(requestDownloading:)]) {
                [request.delegate requestDownloading:request];
            }
        }
    }];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    CLog(@"didResumeAtOffset  fileOffset: %lld  expectedTotalBytes: %lld",fileOffset,expectedTotalBytes);
    /**
     * fileOffset：继续下载时，文件的开始位置
     * expectedTotalBytes：剩余的数据总数
     */
}

#pragma mark -
#pragma mark - NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error
{
    if (error.code == kCFURLErrorCancelled) {
        CLog(@"CLDownload ERROR 请求取消");
        return;
    }
    __block CLDownloadRequest *matchingRequest = nil;
    [self.taskList enumerateObjectsUsingBlock:^(CLDownloadRequest *request, NSUInteger idx, BOOL *stop) {
        if([request.task isEqual:task]) {
            matchingRequest = request;
            if(error) {
                CLog(@"CLDownload ERROR Failed to  downloaded  with error %@", error);
                if ([request.delegate respondsToSelector:@selector(requestDownloadFaild:aError:)]) {
                    [request.delegate requestDownloadFaild:request aError:error];
                }
            }else{
                if ([request.delegate respondsToSelector:@selector(requestDownloadFinish:)]) {
                    [request.delegate requestDownloadFinish:request];
                }
            }
            *stop = YES;
        }
    }];
    [self removeTasklistAtRequest:matchingRequest];
}

#pragma mark -
#pragma mark NSURLSession Authentication delegates

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        
        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
    }
    __block CLDownloadRequest *matchingRequest = nil;
    [self.taskList enumerateObjectsUsingBlock:^(CLDownloadRequest *request, NSUInteger idx, BOOL *stop) {
        if([request.task isEqual:task]) {
            matchingRequest = request;
            *stop = YES;
        }
    }];
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic] ||
       [challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPDigest]){
        
        if([challenge previousFailureCount] == 3) {
            completionHandler(NSURLSessionAuthChallengeRejectProtectionSpace, nil);
        } else {
            NSURLCredential *credential = [NSURLCredential credentialWithUser:matchingRequest.username
                                                                     password:matchingRequest.password
                                                                  persistence:NSURLCredentialPersistenceNone];
            if(credential) {
                completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
            } else {
                completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
            }
        }
    }
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
@end
