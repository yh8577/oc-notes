//
//  YHNeteorkTools.m
//  WYJM
//
//  Created by jyh on 2018/3/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNeteorkTools.h"

@implementation YHNeteorkTools
    
+ (instancetype)sharedManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        http://c.m.163.com/nc/ad/headline/0-4.html
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        instance = [[self alloc] initWithBaseURL:baseUrl sessionConfiguration:configuration];
    });
    return instance;
}
    
    
@end
