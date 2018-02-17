//
//  WXMessageModel.m
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXMessageModel.h"

@implementation WXMessageModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
