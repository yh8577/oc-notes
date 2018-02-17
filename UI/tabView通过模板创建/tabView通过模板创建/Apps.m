//
//  Apps.m
//  通过模板创建 tableView
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Apps.h"

@implementation Apps

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
