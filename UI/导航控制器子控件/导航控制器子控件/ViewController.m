//
//  ViewController.m
//  导航控制器子控件
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 修改系统的放回按钮参数
    UIBarButtonItem *itemBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    
    // 直接修改系统返回按钮的参数
    self.navigationItem.backBarButtonItem = itemBack;
    

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
