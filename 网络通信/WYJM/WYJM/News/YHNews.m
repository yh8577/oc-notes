//
//  YHNews.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNews.h"
#import "YHNeteorkTools.h"
@implementation YHNews
+ (instancetype)newsListWithDic:(NSDictionary *)dic {
    YHNews *newsList = [self new];
    [newsList setValuesForKeysWithDictionary:dic];
    return newsList;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
+ (void)newsListWithURLString:(NSString *)urlString successBlock:(void(^)(NSArray *))SuccessBlock errorBlock:(void(^)(void))errorBlock {
    //http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html
    [[YHNeteorkTools sharedManager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        //获取字典的第一个键responseObject.keyEnumerator.nextObject
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *arr = responseObject[rootKey];
        
        // 字典转模型
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:4];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YHNews *newsList = [YHNews newsListWithDic:obj];
            [arrM addObject:newsList];
        }];
        if (SuccessBlock) {
            SuccessBlock(arrM.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errors) {
        if (errorBlock) {
            errorBlock();
        }
    }];
}
@end
