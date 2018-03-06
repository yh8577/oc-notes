//
//  YHSessionDownload.h
//  Session-断点续传
//
//  Created by jyh on 2018/3/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHSessionDownload : NSObject
+ (instancetype)sharedDownloader;
+ (void)start:(NSString *)urlStr successBlock:(void(^)(BOOL isSuccess))successBlock progressBlock:(void(^)(float progress))progressBlock errorBlock:(void(^)(NSError *error))errorBlock;
+ (void)pause;
+ (void)resume;
@end
