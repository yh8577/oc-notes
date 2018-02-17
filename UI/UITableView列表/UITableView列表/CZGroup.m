//
//  CZGroup.m
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZGroup.h"
#import "CZFriend.h"
@implementation CZGroup

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict_f in self.friends) {
            CZFriend *friend = [CZFriend friendWithdict:dict_f];
            [arrM addObject:friend];
        }
        self.friends = arrM;
        
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
