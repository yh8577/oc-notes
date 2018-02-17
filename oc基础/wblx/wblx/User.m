//
//  User.m
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc {
    
    NSLog(@"User 销毁");
    [_nicName release];
    [_account release];
    
    [super dealloc];
}

@end
