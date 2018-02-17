
//
//  block2.m
//  block练习
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "block2.h"

@implementation block2


- (instancetype)init {
    if (self = [super init]) {
        for (int i = 1; i < 11; i++) {
            _arr[i-1] = i * 10;
        }
    }
    
    return self;
}

- (void)bianLiWithBlock:(void (^)(int val))valblock {
    
    for ( int i = 0; i < 10; i++) {
       // NSLog(@"%d",i);
        
        valblock(_arr[i]);
    }
    
    
}

@end
