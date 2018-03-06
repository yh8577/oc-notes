//
//  YHDownloader.h
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YHDownloader;


@interface YHDownloader : NSObject

+ (instancetype)sharedDownloader;
/**
 开始下载
 @param urlStr 下载地址
 @param successBlock 完成
 @param progressBlock 进度
 @param errorBlock 错误
 */
- (void)startDownload:(NSString *)urlStr successBlock:(void(^)(BOOL isSuccess))successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error))errorBlock;
/**
  暂停下载
 */
- (void)suspendDownload;

/**
 删除
 */
- (void)removeFileForKey:(NSString *)urlStr;
@end
