//
//  QQMessage.m
//  QQ聊天界面
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QQMessage.h"

@implementation QQMessage

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
