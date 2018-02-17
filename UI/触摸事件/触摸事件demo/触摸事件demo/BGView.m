//
//  BGView.m
//  触摸事件demo
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "BGView.h"
#import "TouchView.h"
@interface BGView ()
@property (weak, nonatomic) IBOutlet TouchView *touchView;

@end

@implementation BGView

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    
    //    CGPoint p = [t locationInView:self.superview];
    CGPoint p = [t locationInView:self];
    //    CGPoint lastP = [t previousLocationInView:self.superview];
    CGPoint lastP = [t previousLocationInView:self];
    
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    self.touchView.center = CGPointMake(self.touchView.center.x + offsetX, self.touchView.center.y + offsetY);
}

@end
