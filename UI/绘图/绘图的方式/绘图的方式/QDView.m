//
//  QDView.m
//  绘图的方式
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView


/*
 
 注意点:
 
 使用 CGMutablePathRef 必须关闭上下文,才能释放内存.

 绘图代码一定要写在 drawRect 方法中
 写在 drawRect 方法中 才能回去上下文对象.
 drawRect只能系统调用.
 view 第一次显示的时候调用
 当 viewe 重绘的时候调用
 
 重绘方法
 1.     [self setNeedsDisplay]
 2.     [self setNeedsDisplayInRect:(CGRect)]  CGRect : 需要重绘的区域
 重绘 就是刷新 view

 
 */

- (void)drawRect:(CGRect)rect {
    
    [self text2];
}

- (void)text5 {
    //方式5 : oc
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    
    [path stroke];
}

- (void)text4 {
    //方式4 : C 语言 + oc
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 200);
    
    // c 的拼接 oc 的路径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithCGPath:path];
    [path1 addLineToPoint:CGPointMake(200, 50)];
    
    CGContextAddPath(ctx, path1.CGPath);
    
    CGContextStrokePath(ctx);
    
    // 释放
//    CGPathRelease(path);
    // 注意点: 只要是Core Foundation 的对象都可以使用 CFRelease 释放
    CFRelease(path);
}

- (void)text3{
    
    //方式3 : C 语言 + oc
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    
    // oc
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(50, 50)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    
    // 这里注意 path 是 oc 类型的所以要转一下在后面加上 .CGPath
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
}

- (void)text2{
    //方式2 : C 语言
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 200);
    
    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    
    // 释放
    // 方法1
//    CGPathRelease(path);
    
    // 注意点: 只要是Core Foundation 的对象都可以使用 CFRelease 释放
    CFRelease(path);
}

- (void)text1{
    //方式1 : C 语言
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 50, 50);
    
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextStrokePath(ctx);
}


@end
