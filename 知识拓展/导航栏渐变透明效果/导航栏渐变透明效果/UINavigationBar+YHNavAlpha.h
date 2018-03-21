//
//  UINavigationBar+YHNavAlpha.h
//  导航栏渐变透明效果
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (YHNavAlpha)
@property (nonatomic, strong) UIView *alphaView;

// 渐变透明的方法
- (void)navigationToAlpha:(UIColor *)color;
@end
