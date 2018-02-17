//
//  QDView.m
//  裁剪上下文图片
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView

- (void)drawRect:(CGRect)rect {
   
    UIImage *image = [UIImage imageNamed:@"1"];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 150, 150, 150, 0, 2 * M_PI, 1);
    
    // 可以通过 CGContextFillPath 确定显示的区域
//    CGContextFillPath(ctx);
    
    CGContextClip(ctx);
    
    [image drawInRect:rect];
    
}


@end
