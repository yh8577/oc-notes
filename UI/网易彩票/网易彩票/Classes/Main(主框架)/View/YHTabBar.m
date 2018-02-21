//
//  YHTabBar.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHTabBar.h"

@interface YHTabBarButton : UIButton

@end

@implementation YHTabBarButton
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end

@interface YHTabBar ()

@property (nonatomic,weak)UIButton *currentButton;
@end

@implementation YHTabBar

- (void)addButtonWithImageName:(NSString *)imageName {
    
    YHTabBarButton *tabBarButton = [[YHTabBarButton alloc] init];
    
    [tabBarButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_new",imageName]] forState:(UIControlStateNormal)];
    [tabBarButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected_new",imageName]] forState:(UIControlStateSelected)];
    
    [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:(UIControlEventTouchDown)];
    
    [self addSubview:tabBarButton];
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; ++i) {
        
        UIButton *tabBarButton = self.subviews[i];
        tabBarButton.tag = i;
        
        CGFloat w = kScreenWidth / 5;
        CGFloat h = 49;
        CGFloat x = i * w;
        CGFloat y = 0;
        tabBarButton.frame = CGRectMake(x, y, w, h);
        
        if (i ==  0) {
            [self tabBarButtonClick:tabBarButton];
        }
    }
}

- (void)tabBarButtonClick:(UIButton *)sender {
    
    self.currentButton.selected = NO;
    
    sender.selected = YES;
    
    self.currentButton = sender;
    
    if (self.tabBarButonBlock) {
        self.tabBarButonBlock(sender.tag);
    }
}



@end
