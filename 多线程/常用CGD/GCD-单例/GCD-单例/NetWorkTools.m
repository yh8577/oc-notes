//
//  NetWorkTools.m
//  GCD-单例
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools
// 单例
+ (instancetype)sharedNetWorkTools {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}
@end
