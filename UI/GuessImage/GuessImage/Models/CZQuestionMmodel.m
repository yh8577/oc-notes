//
//  CZQuestionMmodel.m
//  GuessImage
//
//  Created by jyh on 2018/2/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZQuestionMmodel.h"

@implementation CZQuestionMmodel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.options = dict[@"options"];
    }
    
    return self;
}


+ (instancetype)questionWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}


@end
