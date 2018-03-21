 //
//  YHNavAlphaTableViewController.m
//  导航栏渐变透明效果
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHNavAlphaTableViewController.h"
#import "UINavigationBar+YHNavAlpha.h"
@interface YHNavAlphaTableViewController ()

@end

@implementation YHNavAlphaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的颜色";
 [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIColor *color = [UIColor redColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 30) {
       CGFloat alphaSet = (30 + 64 - offsetY) / 64;
        [self.navigationController.navigationBar navigationToAlpha:[color colorWithAlphaComponent:alphaSet]];
    } else {
        self.navigationController.navigationBar.alpha = 1;
    }
}


@end
