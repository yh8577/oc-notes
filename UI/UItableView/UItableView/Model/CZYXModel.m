//
//  CZYXModel.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZYXModel.h"

@implementation CZYXModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)yxWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

@end
