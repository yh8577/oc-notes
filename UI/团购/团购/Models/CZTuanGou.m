//
//  CZTuanGou.m
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZTuanGou.h"

@implementation CZTuanGou

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tuangouWithDitc:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}
@end
