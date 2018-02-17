//
//  Flags.m
//  picker_Demo3
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Flags.h"

@implementation Flags

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
