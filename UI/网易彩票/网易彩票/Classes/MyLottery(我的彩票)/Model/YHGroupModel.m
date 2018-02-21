//
//  YHGroupModel.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGroupModel.h"
#import "YHItemsMmodel.h"
@implementation YHGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];

        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *items in dict[@"items"]) {
            YHItemsMmodel *model = [YHItemsMmodel itemsWithDict:items];
            [arrM addObject:model];
        }
        self.items = arrM;
    }
    
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
