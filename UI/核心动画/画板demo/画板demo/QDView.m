//
//  QDView.m
//  画板demo
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"
#import "QDViewBezierPath.h"
@interface QDView ()
@property(nonatomic,strong)NSMutableArray *paths;
@end
@implementation QDView



- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

// 橡皮
- (void)eraser {
    self.lineColor = self.backgroundColor;
}

// 回退
- (void)back {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

// 清屏
- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    
    CGPoint p = [t locationInView:t.view];
    
    QDViewBezierPath *path = [[QDViewBezierPath alloc] init];
    
    [path setLineWidth:self.lineWidth];
    [path setLineColor:self.lineColor];
    
    [path moveToPoint:p];
    
    
    [self.paths addObject:path];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    
    CGPoint p = [t locationInView:t.view];
    
    [self.paths.lastObject addLineToPoint:p];
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    for (QDViewBezierPath *path in self.paths) {
        [path setLineJoinStyle:(kCGLineJoinRound)];
        [path setLineCapStyle:(kCGLineCapRound)];
        
        [path.lineColor set];
        
        [path stroke];
    }
    
}


@end
