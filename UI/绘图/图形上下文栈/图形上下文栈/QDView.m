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
    
    // 备份上下文
    CGContextSaveGState(ctx);
    
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, 1);
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    
    CGContextSetLineWidth(ctx, 5);
    
    [[UIColor redColor] set];
    
    CGContextStrokePath(ctx);
    
    // 恢复上下文
    // 注意点: 只要在下一次渲染之前恢复, 恢复匹配最近的备份. 备份只对备份以上的代码有效.备份一下的代码不会做备份.
    CGContextRestoreGState(ctx);
    
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 250, 20);
    
    CGContextStrokePath(ctx);
}


@end
