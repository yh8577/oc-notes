//
//  UINavigationBar+YHNavAlpha.m
//  导航栏渐变透明效果
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "UINavigationBar+YHNavAlpha.h"
#import <objc/runtime.h>
@implementation UINavigationBar (YHNavAlpha)
static char alphaView;
- (UIView *)alphaView {
    return objc_getAssociatedObject(self, &alphaView);
}

- (void)setAlphaView:(UIView *)YHNAlphaView {
    return objc_setAssociatedObject(self, &alphaView, YHNAlphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)navigationToAlpha:(UIColor *)color {
    if (!self.alphaView) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        
        [self insertSubview:self.alphaView atIndex:0];
    }
    // 设置颜色
    self.alphaView.backgroundColor = color;
}

@end
