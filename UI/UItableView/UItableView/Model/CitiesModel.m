
//
//  CitiesModel.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CitiesModel.h"

@implementation CitiesModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
    
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}


+ (instancetype)citiesModelDict:(NSDictionary *)dict {
    
    return  [[self alloc] initWithDict:dict];
}


@end
