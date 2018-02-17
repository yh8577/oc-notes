//
//  QDView.m
//  自定义进度条
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"
@interface QDView()
@property (weak, nonatomic) IBOutlet UILabel *progressLbl;
@end

@implementation QDView

- (void)setNumber:(CGFloat)number {
    
    _number = number;
    self.progressLbl.text = [NSString stringWithFormat:@"%.2f%%",number * 100];
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 - M_PI_2 endAngle:2 * M_PI * self.number - M_PI_2 clockwise:1];
    [path addLineToPoint:CGPointMake(150, 150)];
    
    [[UIColor redColor] set];
    
    [path fill];
    
}


@end
