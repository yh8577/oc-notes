//
//  Download.m
//  多线程图片下载
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Download.h"

@implementation Download

+ (NSArray *)download {
    
    NSString *pathName = [[NSBundle mainBundle] pathForResource:@"imageData.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:pathName];
    
    // 这样性能会高一些
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:10];
    
    for (NSDictionary *dict in arr) {
        Download *model = [self downloadWithDict:dict];
        [arrM addObject:model];
    }
    
    return arrM.copy;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)downloadWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}
@end
