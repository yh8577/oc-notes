//
//  ViewController.m
//  消息循环
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(demo) userInfo:nil repeats:YES];
//    NSDefaultRunLoopMode // 操作 ui 控件不停止执行
//    NSRunLoopCommonModes // 操作 ui 不会影响执行

    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}


- (void)demo {
    
    // 获取当前消息循环的模式
    NSLog(@"hello %@",[NSRunLoop currentRunLoop].currentMode);
}

@end
