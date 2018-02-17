//
//  CZFriend.m
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZFriend.h"

@implementation CZFriend

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype)friendWithdict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
