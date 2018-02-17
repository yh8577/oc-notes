//
//  Baby.m
//  婴儿
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Baby.h"

@implementation Baby

- (void)cry{
    NSLog(@"baby cry");
    [_nanny nurse];
    NSLog(@"喝饱了");
}

- (void)babySleep{
    NSLog(@"baby sleep");
    [_nanny coaxBabySleep];
    NSLog(@"睡着了");
}

@end
