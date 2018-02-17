//
//  CZWeiboModel.m
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZWeiboModel.h"

@implementation CZWeiboModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weiboModelWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}


@end
