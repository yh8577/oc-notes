//
//  ViewController.m
//  Modal跳转
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    /*
     注意点: 如果两个控制器没有业务逻辑就用 modal
            如果两个控制器有业务关系就有 push
     */
    
}

// 代码跳转
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController1 *vc1 = [[ViewController1 alloc] init];

    vc1.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentViewController:vc1 animated:YES completion:nil];
}

@end
