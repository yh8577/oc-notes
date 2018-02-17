//
//  PieChart.m
//  饼图封装
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "PieChart.h"

@implementation PieChart

+ (instancetype)pieChartView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"PieChart" owner:nil options:nil].firstObject;
}

- (void)drawRect:(CGRect)rect {
    
    // 抛出异常
//    if (!(self.bounds.size.width == self.bounds.size.height)) {
//
//        // 方法1
////        [NSException raise:@"123" format:@"321"];
//
//        // 方法2
//        NSException *ex = [NSException exceptionWithName:@"123" reason:@"321" userInfo:nil];
//        [ex raise];
//
//    }
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGPoint center = CGPointMake(w * 0.5, h * 0.5);
    CGFloat radius = MIN(w, h) * 0.5 - 10;
    CGFloat start = 0;
    CGFloat end = 0;
    
    for (int i = 0; i < self.values.count; i++) {
        
        end = 2 * M_PI * [self.values[i] floatValue] + start;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:1];
        [path addLineToPoint:center];
        
        CGFloat r = (CGFloat)arc4random_uniform(256) / 255.0;
        CGFloat g = (CGFloat)arc4random_uniform(256) / 255.0;
        CGFloat b = (CGFloat)arc4random_uniform(256) / 255.0;
        
        [[UIColor colorWithRed:r green:g blue:b alpha:1.0] set];
        
        [path fill];
        
        start = end;
    }
    
}



@end
