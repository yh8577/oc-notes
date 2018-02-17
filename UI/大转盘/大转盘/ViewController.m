//
//  ViewController.m
//  大转盘
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHRotateView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 直接设置控制器背景图片
    self.view.layer.contents = CFBridgingRelease([UIImage imageNamed:@"3"].CGImage);
    
    YHRotateView *rotateView = [YHRotateView rotateView];
    rotateView.center = self.view.center;
    [rotateView startRotate];
    [self.view addSubview:rotateView];
    
}


@end
