//
//  TouchView.m
//  触摸事件demo
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    
    CGPoint localP = [t locationInView:self.superview];
    
    self.center = localP;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    
//    CGPoint p = [t locationInView:self.superview];
    CGPoint p = [t locationInView:self];
//    CGPoint lastP = [t previousLocationInView:self.superview];
    CGPoint lastP = [t previousLocationInView:self];
    
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
