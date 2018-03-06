//
//  YHDownloaderManager.m
//  下载文件
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloaderManager.h"
#import "YHDownloader.h"

@interface YHDownloaderManager ()
@property (nonatomic, strong) NSMutableDictionary *downloaderCache;
@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, copy) void(^progressBlock)(float progress);
@end

@implementation YHDownloaderManager
+ (instancetype)sharedManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

- (NSMutableDictionary *)downloaderCache {
    if (!_downloaderCache) {
        _downloaderCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _downloaderCache;
}

// 开始下载
- (void)startDownload:(NSString *)urlStr successBlock:(void(^)(BOOL isSuccess))successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error))errorBlock {
    
    self.urlStr = urlStr;
    
    if (self.downloaderCache[urlStr]) {
        NSLog(@"下载中....");
        return;
    }
    
    self.progressBlock = progressBlock;
    
    YHDownloader *downloader = [YHDownloader sharedDownloader];
    
    [self.downloaderCache setObject:downloader forKey:urlStr];
    
    [downloader startDownload:urlStr successBlock:^(BOOL isSuccess) {
        [self.downloaderCache removeObjectForKey:urlStr];
        if (successBlock) {
            successBlock(YES);
        }
    } progressBlock:progressBlock errorBlock:^(NSError *error) {
        [self.downloaderCache removeObjectForKey:urlStr];
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
// 暂停下载
- (void)suspendDownload:(NSString *)urlStr  {
    
    YHDownloader *downloader = self.downloaderCache[urlStr];
    if (!downloader) {
        NSLog(@"没有下载操作");
        return;
    }
    [downloader suspendDownload];
    [self.downloaderCache removeObjectForKey:urlStr];
}

/**
 删除
 */
- (void)removeFileForKey:(NSString *)urlStr {
    [self.downloaderCache removeObjectForKey:urlStr];
    [[YHDownloader sharedDownloader] removeFileForKey:urlStr];
    [self performSelector:@selector(setProgress) withObject:nil afterDelay:0.25];
}

- (void)setProgress {
    if (self.progressBlock) {
        self.progressBlock(0.0);
    }
}

@end
