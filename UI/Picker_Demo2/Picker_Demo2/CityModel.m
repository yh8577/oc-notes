//
//  CityModel.m
//  Picker_Demo2
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)cityModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
