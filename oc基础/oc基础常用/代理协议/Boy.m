//
//  Boy.m
//  代理协议
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Boy.h"

@implementation Boy

- (void)talkLove {
    NSLog(@"我回来了");
    [_girlFrirnd wash];
    [_girlFrirnd cook];
    NSLog(@"明天继续");
}

@end
