//
//  YHItemsMmodel.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHItemsMmodel.h"

@implementation YHItemsMmodel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)itemsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
