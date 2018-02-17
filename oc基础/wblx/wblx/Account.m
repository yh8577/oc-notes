//
//  Account.m
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Account.h"

@implementation Account

- (void)dealloc {
    
    NSLog(@"Account 销毁");
    [_userName release];
    [_password release];
    
    [super dealloc];
}

@end
