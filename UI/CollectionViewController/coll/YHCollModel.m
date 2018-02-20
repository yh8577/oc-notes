//
//  YHCollModel.m
//  coll
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHCollModel.h"

@implementation YHCollModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)collModelWith:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
