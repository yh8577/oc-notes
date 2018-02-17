//
//  Person.m
//  单例模式
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    // 创建一个静态变量
    static id instance = nil;
    if (!instance) {
        instance = [super allocWithZone:zone];
    }
    
    return instance;
}


+ (instancetype)sharedPerson {
    return [self new];
}
+ (instancetype)defaultPerson {
    return [self new];
}

@end
