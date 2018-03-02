//
//  YHDownloader.h
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YHDownloader;
@protocol YHDownloaderDelgate <NSObject>

- (void)YHDownloader:(YHDownloader *)YHDownloader progress:(float)progress;

@end

@interface YHDownloader : NSObject
/** 下载进度progress */
@property (nonatomic, weak) id<YHDownloaderDelgate> delegate;

+ (instancetype)sharedDownloader;

// 开始下载
- (void)startDownload:(NSString *)urlStr;
// 继续下载
- (void)continuetoDownload;
// 暂停下载
- (void)suspendDownload;
@end
