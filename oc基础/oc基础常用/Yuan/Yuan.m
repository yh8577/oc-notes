//
//  Yuan.m
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Yuan.h"

@implementation Yuan


/*
 面积=圆周率*半径*半径
 圆的周长=圆周率*直径=2*圆周率*半径
 */
- (void)mianJi {
    
    NSLog(@"面积 %.2f 平方米", ((M_PI * _radius) * _radius));
}

- (void)zhouChang {
    
    NSLog(@"周长是:%.2f", (2 * M_PI * _radius));
}
@end
