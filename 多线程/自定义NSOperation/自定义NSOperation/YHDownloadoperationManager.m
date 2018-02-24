//
//  YHDownloadoperationManager.m
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloadoperationManager.h"

@implementation YHDownloadoperationManager

+ (instancetype)shaerdManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}


@end
