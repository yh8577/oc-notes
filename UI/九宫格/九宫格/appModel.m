//
//  appModel.m
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "appModel.h"

@implementation appModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
    
        self.title = dict[@"title"];
        self.img = dict[@"img"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

@end
