//
//  YHDownloadManager.m
//  NSOperation下载类管理者
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloadManager.h"
#import "YHDownloadOperation.h"
#import "NSString+Sandbox.h"
@interface YHDownloadManager ()
// 队列
@property(nonatomic,strong)NSOperationQueue *queue;
// 图片缓存池
@property(nonatomic,strong)NSCache *imageCache;
// 任务缓存池
@property(nonatomic,strong)NSMutableDictionary *operationCache;
@end

@implementation YHDownloadManager
// 单例
+ (instancetype)shaerdManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

// 懒加载队列
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

// 懒加载图片缓存池
- (NSCache *)imageCache {
    if (!_imageCache) {
        _imageCache = [[NSCache alloc] init];
        _imageCache.countLimit = 50;
    }
    return _imageCache;
}

// 下载方法
- (void)downloadWithUrl:(NSString *)url finshedBlock:(void(^)(UIImage *image))finshedBlock {
    
    NSAssert(finshedBlock, @"finshedBlock 不能为空");
    // 任务是否被取消,如果取消直接返回;
    if (self.operationCache[url]) {
        return;
    }
    // 内存或沙盒是否已经有缓存
    if ([self chaeckImage:url]) {
        // 直接取从缓存中取.
        finshedBlock([self.imageCache objectForKey:url]);
        return;
    }
    // 创建下载任务
    YHDownloadOperation *op = [YHDownloadOperation downloadOperationWithUrl:url finshedBlock:^(UIImage *image) {
        if (!image) {
            return ;
        }
        // 回调
        finshedBlock(image);
        // 加入缓存池中
        [self.imageCache setObject:image forKey:url];
    }];
    
    // 加入队列中
    [self.queue addOperation:op];
    // 加入任务缓存池中
    self.operationCache[url] = op;
}

// 获取缓存图片
- (BOOL)chaeckImage:(NSString *)url {
    if ([self.imageCache objectForKey:url]) {
        NSLog(@"内存加载");
        return YES;
    }
    UIImage *image = [UIImage imageWithContentsOfFile:[url appendCache]];
    if (image) {
        [self.imageCache setObject:image forKey:url];
        NSLog(@"沙盒加载");
        return YES;
    }
    return NO;
}

// 取消方法
- (void)cancelDownload:(NSString *)url {
    // 取消任务
    [self.operationCache[url] cancel];
    // 将任务从缓存池中移除
    if (url) {
        [self.operationCache removeObjectForKey:url];
    }
}
@end
