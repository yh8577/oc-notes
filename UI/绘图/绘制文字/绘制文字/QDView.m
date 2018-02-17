//
//  QDView.m
//  绘制文字
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView


- (void)drawRect:(CGRect)rect {
    
    NSString *str = @"绘制文字";
    
    // 从那个点开始画
    // 不能换行
//    [str drawAtPoint:CGPointZero withAttributes:nil];

    NSShadow *s = [[NSShadow alloc] init];
    s.shadowOffset = CGSizeMake(50, 50);
    s.shadowBlurRadius = 3;
    s.shadowColor = [UIColor orangeColor];
    // 画到那个区域
    [str drawInRect:rect withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20],NSForegroundColorAttributeName: [UIColor redColor] ,NSShadowAttributeName : s}];
    
}


@end
