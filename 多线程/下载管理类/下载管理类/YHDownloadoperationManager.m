//
//  YHDownloadoperationManager.m
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloadoperationManager.h"
#import "YHDownloaderOperation.h"
#import "NSString+Sandbox.h"
@interface YHDownloadoperationManager ()
@property(nonatomic,strong)NSOperationQueue *queue;
@property(nonatomic,strong)NSMutableDictionary *operationCache;
@property(nonatomic,strong)NSMutableDictionary *imageCache;
@end

@implementation YHDownloadoperationManager

- (NSMutableDictionary *)imageCache {
    if (!_imageCache) {
        _imageCache = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    return _imageCache;
}

- (NSMutableDictionary *)operationCache {
    if (!_operationCache) {
        _operationCache = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    return _operationCache;
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

+ (instancetype)shaerdManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}
- (void)downloadWithUrlString:(NSString *)urlString finshedBlock:(void(^)(UIImage *img))finshedBlock {
    NSAssert(finshedBlock != nil , @"finshedBlock 不能为空");
    
    // 判断是否被取消
    if (self.operationCache[urlString]) {
        return;
    }
    
    if ([self chaeckImage:urlString]) {
        finshedBlock(self.imageCache[urlString]);
        return;
    }
    
    YHDownloaderOperation *op = [YHDownloaderOperation downloadOperationWithUrlString:urlString finshedBlock:^(UIImage *img) {
        finshedBlock(img);
        NSLog(@"下载图片");
        self.imageCache[urlString] = img;
        [self.operationCache removeObjectForKey:urlString];
    }];
    [self.queue addOperation:op];
    self.operationCache[urlString] = op;
}

- (BOOL)chaeckImage:(NSString *)urlString {
    
    if (self.imageCache[urlString]) {
        NSLog(@"内存加载");
        return YES;
    }
    
    UIImage *img = [UIImage imageWithContentsOfFile:[urlString appendCache]];
    if (img) {
        self.imageCache[urlString] = img;
        NSLog(@"沙盒加载");
        return YES;
    }
    return NO;
}

- (void)cancelOperation:(NSString *)urlString {
    [self.operationCache[urlString] cancel];
    if (urlString) {
        [self.operationCache removeObjectForKey:urlString];
    }
}

@end
