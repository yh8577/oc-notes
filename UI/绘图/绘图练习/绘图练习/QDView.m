//
//  QDView.m
//  绘图练习
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 重绘
    [self setNeedsDisplay];
    
    // 指定区域重绘
//    [self setNeedsDisplayInRect:CGRectMake(0, 0, 150, 150)];
}

- (void)drawRect:(CGRect)rect {

    [self test15:rect];
}

- (void)test15:(CGRect)rect {
    
    // 柱状图
    
    NSArray *arr = @[@1,@0.5,@0.7,@0.3,@0.1,@0.6];
    
    for (int i = 0; i < arr.count; i++) {
        
        CGFloat w = 20;
        CGFloat h = [arr[i] floatValue] * rect.size.height;
        CGFloat x = i * 2 * w;
        CGFloat y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        CGFloat r = ((CGFloat)arc4random_uniform(256) / 255.0);
        CGFloat g = ((CGFloat)arc4random_uniform(256) / 255.0);
        CGFloat b = ((CGFloat)arc4random_uniform(256) / 255.0);
        
        [[UIColor colorWithRed:r green:g blue:b alpha:1.0] set];
        
        [path fill];
        
    }

}

- (void)test14 {
    // 饼图
    NSArray *arr = @[@0.3,@0.1,@0.2,@0.4];
    
    
    CGFloat start = 0;
    CGFloat end = 0;
    for (int i = 0; i < arr.count; i++) {
    
        end = 2 * M_PI * [arr[i] floatValue] + start;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:start endAngle:end clockwise:1];
        [path addLineToPoint:CGPointMake(150, 150)];
        
        CGFloat r = ((CGFloat)arc4random_uniform(256) / 255.0);
        CGFloat g = ((CGFloat)arc4random_uniform(256) / 255.0);
        CGFloat b = ((CGFloat)arc4random_uniform(256) / 255.0);

        [[UIColor colorWithRed:r green:g blue:b alpha:1.0] set];
        
        [path fill];
        
        start = end;
    }
    
}

- (void)test13 {
    // 奇偶填充规则 oc
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200,100)];
    
    [path addArcWithCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];
    path.usesEvenOddFillRule = YES;
    
    [path fill];
    
    
}

- (void)test12 {
    
     // 奇偶填充规则
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(250 , 30, 20, 200)];
    
    CGContextAddPath(ctx, path2.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    
    //奇偶填充规则 注意点: 某个路径被覆盖多遍就不填充
    CGContextDrawPath(ctx, kCGPathEOFill);
}

- (void)test11 {
    
   // oc 渲染方式
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 50)];
    // 关闭路径
    [path closePath];
    
    // 调用 set 方法
    //    [path setLineWidth:5];
    // 调用属性方法
    path.lineWidth = 5;
    // 设置描边颜色
    [[UIColor blueColor] setStroke];
    // 设置填充颜色
    [[UIColor redColor] setFill];
    
    // 执行填充和描边
    //    [[UIColor orangeColor] set];
    
    // 调用描边方法
    [path stroke];
    // 调用填充方法
    [path fill];
    
}


- (void)test10 {
    
    // c 渲染方式
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx ,50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);
    // 关闭路径
    CGContextClosePath(ctx);
    
     CGContextSetLineWidth(ctx, 10);
    
    // 描边
//    CGContextStrokePath(ctx);
    /// 填充
//    CGContextFillPath(ctx);
    
    // 画一路径,,这个方法  和上面两个方法一样
    // 注意点: 如果使用填充,描边颜色就不能用.
    [[UIColor redColor] setStroke];
    [[UIColor blueColor] setFill];
    
    //
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
}


- (void)test9 {
    // 渲染方式
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(100, 50)];
    [path addLineToPoint:CGPointMake(50, 50)];
    
    
    // 颜色
    [[UIColor orangeColor] setStroke];
    
    [path stroke];
    
}

- (void)test8 {

    // oc 绘图的样式 , 样式基本和 c 一样
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    
    [path setLineWidth:5];
    [path setLineJoinStyle:kCGLineJoinRound];
    
    // 颜色
    [[UIColor orangeColor] setStroke];
    
    [path stroke];
}


- (void)test7 {
    
    // c 绘图的样式
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx ,50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    // 线宽
    CGContextSetLineWidth(ctx, 10);

    CGContextAddLineToPoint(ctx, 100, 50);
    
    // 连接处样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    // 头尾样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 透明度
    CGContextSetAlpha(ctx, 0.5);
    
    // 阴影
    CGContextSetShadow(ctx, CGSizeMake(10, 10), 5);
    
    // 平面度
    CGContextSetFlatness(ctx,20);
    
    // 颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    // 也可以使用 oc 的颜色
//    [[UIColor orangeColor] setStroke];
    
    
    CGContextStrokePath(ctx);
    
}


// 注意点: c和oc画弧线区别 c 语言的顺时针是反的.


- (void)test6 {
    
    // 画弧的方法画圆 : c 方法
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 100, 100, 50, 0,  M_PI, 1);
    
    CGContextStrokePath(ctx);
    
}

- (void)test5 {
    
    // 画弧的方法画圆
    /*
     ArcCenter : 圆心
     radius : 半径
     startAngle : 起始位置
     endAngle : 终点位置
     clockwise : 是否,顺时针.
     
     注意点: 起始位置 0 是 3 点的方向
     */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle: 2 * M_PI clockwise:YES];
    
    [path stroke];
}

- (void)test4 {
    // 椭圆 : c 方法
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 200, 100));
    
    CGContextStrokePath(ctx);
}

- (void)test3 {
    
    // 椭圆
    // 注意点:如果宽高一样画出来也是一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 200, 100)];
    
    [path stroke];
}

- (void)test2 {
    
    // 注意点: 如果大于 半径的3分之2 就会显示为圆形
    // 如果半径是宽度的一半就是圆形
    // 圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:33];

    [path stroke];
}

- (void)test1 {
    
    // 矩形
    // 方法1
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    //
    //    [path stroke];
    // 方法2
    [[UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)] stroke];
    
}

@end
