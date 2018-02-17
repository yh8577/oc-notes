//
//  QDView.m
//  旋转缩放平移
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView

- (void)drawRect:(CGRect)rect {
   
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 矩阵操作必须在 添加路径之前
    // 旋转
//    CGContextRotateCTM(ctx, M_PI_4);
    // 缩放
//    CGContextScaleCTM(ctx, 0.5, 0.5);
    // 平移
    CGContextTranslateCTM(ctx, 150, 150);
    
    // 注意点: 没有关闭添加其他路径会连接上
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, 1);
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    
    CGContextSetLineWidth(ctx, 5);
    
    CGContextStrokePath(ctx);
    
}


@end
