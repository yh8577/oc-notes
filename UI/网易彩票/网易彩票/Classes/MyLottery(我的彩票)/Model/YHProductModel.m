//
//  YHProductModel.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHProductModel.h"

@implementation YHProductModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}
+ (instancetype)productWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
