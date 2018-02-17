//
//  Microblog.m
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Microblog.h"

@implementation Microblog


- (void)dealloc {
    
    NSLog(@"Microblog 销毁");
    [_content release];
    [_imgURL release];
    [_user release];
    [_zhuanFaBlog release];
    
    [super dealloc];
}

@end
