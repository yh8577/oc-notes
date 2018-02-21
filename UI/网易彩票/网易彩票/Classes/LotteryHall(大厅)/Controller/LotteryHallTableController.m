//
//  LotteryHallTableController.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "LotteryHallTableController.h"

@interface LotteryHallTableController ()
@property (nonatomic,weak)UIImageView *imageView;
@property (nonatomic,weak)UIView *coverView;
@end

@implementation LotteryHallTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
    // 修改图片不被渲染
    // 方法1在图片里面可以设置.
    // 方法2用代码设置
    // image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(activityClick)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)activityClick {
    
    UIView *coverView = [[UIView alloc] initWithFrame:kScreenSize];
    coverView.backgroundColor = [UIColor grayColor];
    coverView.alpha = 0.5;
    self.coverView = coverView;
    // 注意点添加最外层的控制器,也就是 tabbar 上这样 才能把上下挡住
    [self.tabBarController.view addSubview:coverView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiaopingguo"]];
    
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    self.imageView = imageView;
    [self.tabBarController.view addSubview:imageView];
    
    UIButton *closeButton = [[UIButton alloc] init];
    UIImage *closeButtonImage = [UIImage imageNamed:@"alphaClose"];
    [closeButton setImage: closeButtonImage forState:(UIControlStateNormal)];
    closeButton.frame = CGRectMake(imageView.frame.size.width - closeButtonImage.size.width, 0, 0, 0);
    [closeButton sizeToFit];
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    [imageView addSubview:closeButton];
    
}

- (void)closeButtonClick {
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.imageView removeFromSuperview];
        [self.coverView removeFromSuperview];
    }];
    
}


@end
