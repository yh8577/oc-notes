//
//  YHImageModel.m
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHImageModel.h"

@implementation YHImageModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)imageModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)imageModelWithPlistName:(NSString *)plistName {
    
    NSString *pathName = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:pathName];
    // 这样性能会高一些
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:10];
    
    for (NSDictionary *dict in arr) {
        YHImageModel *model = [self imageModelWithDict:dict];
        [arrM addObject:model];
    }
    return arrM.copy;
}

@end
