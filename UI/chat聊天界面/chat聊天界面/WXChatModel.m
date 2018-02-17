//
//  WXChatModel.m
//  chat聊天界面
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXChatModel.h"

@implementation WXChatModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)chatModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
