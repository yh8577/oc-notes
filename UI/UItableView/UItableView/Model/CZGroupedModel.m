//
//  CZGroupedModel.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZGroupedModel.h"
#import "CZCarModel.h"
@implementation CZGroupedModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *carsM = [NSMutableArray array];
        
        for (NSDictionary *cars_dict in dict[@"cars"]) {
            CZCarModel *model = [CZCarModel catWithDict:cars_dict];
            [carsM addObject:model];
        }
        self.cars = carsM;
    }
    
    return self;
}

+ (instancetype)groupedWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

@end
