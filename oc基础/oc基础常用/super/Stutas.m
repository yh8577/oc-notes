//
//  Stutas.m
//  lx
//
//  Created by jyh on 2018/1/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Stutas.h"

@implementation Stutas

- (void)seyHi {
    
    [super seyHi];
    [super setName:@"abcd"];
    //[super setName:@"abcd"];
    NSLog(@"Stutas %@", [super name]);
    
    NSLog(@"新键盘不是很好用.....");
    
    
    
}
- (void)call {
    
   // [self seyHi];
    
    [super seyHi];
    [self seyHi];
    
    
}
@end



































