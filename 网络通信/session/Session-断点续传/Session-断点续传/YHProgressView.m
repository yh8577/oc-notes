//
//  YHProgressView.m
//  下载文件
//
//  Created by jyh on 2018/3/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHProgressView.h"

@implementation YHProgressView

- (void)setFontOfSize:(float)fontOfSize {
    _fontOfSize = fontOfSize;
     self.titleLabel.font = [UIFont systemFontOfSize:_fontOfSize];
    [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self setTitle:title forState:(UIControlStateNormal)];
}

- (void)setProgress:(float)progress {
    _progress = progress;

    NSString *progressStr = nil;
    if (progress == 1.0) {
        progressStr = @"下载完成";
    } else {
        progressStr = [NSString stringWithFormat:@"%.02f%%",progress * 100];
    }
    [self setTitle:progressStr forState:(UIControlStateNormal)];
    [self setTitleColor:[self randomColorWithNum:progress] forState:(UIControlStateNormal)];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat lineWidth = 5;
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = MIN(center.x, center.y) - lineWidth * 2;
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = 2 * M_PI * self.progress + startAngle;
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    path.lineWidth = lineWidth;
    path.lineCapStyle = kCGLineCapRound;
    [[self randomColorWithNum:self.progress] setStroke];
    [path stroke];
    
}

- (UIColor *)randomColorWithNum:(float)num {
    CGFloat green = 0.5 - (self.progress * arc4random_uniform(256) / 255.0);
    CGFloat blue = 0.8 - (self.progress * arc4random_uniform(256) / 255.0);
    return [UIColor colorWithRed:0.9 green:green blue:blue alpha:1.0];
}

@end
