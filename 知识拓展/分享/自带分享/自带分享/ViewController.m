//
//  ViewController.m
//  自带分享
//
//  Created by jyh on 2018/3/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 这个基本弃用
    // 判断系统服务是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        NSLog(@"请先配置账号");
        return;
    }

    // 创建分享控制器
    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    
    // 设置文字
    [composeVC setInitialText:@"世界上有多少种人"];
    
    // 设置图片
    [composeVC addImage:[UIImage imageNamed:@"3"]];
    
    // 设置网址
    [composeVC addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    // 模态视图弹出
    [self presentViewController:composeVC animated:YES completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
}


@end
