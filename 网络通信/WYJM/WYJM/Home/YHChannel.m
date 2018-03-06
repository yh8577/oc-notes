//
//  YHChannel.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHChannel.h"

@implementation YHChannel

+ (instancetype)channelWithDic:(NSDictionary *)dic {
    YHChannel *chennel = [self new];
    [chennel setValuesForKeysWithDictionary:dic];
    return chennel;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (NSArray *)channels {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:10];
    NSArray *array = dic[@"tList"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YHChannel *channel = [self channelWithDic:obj];
        [arrM addObject:channel];
    }];
    return [arrM sortedArrayUsingComparator:^NSComparisonResult(YHChannel *obj1, YHChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

- (NSString *)urlString {
    return [NSString stringWithFormat:@"article/headline/%@/0-140.html",self.tid];
}

@end
