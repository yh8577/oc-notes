//
//  ViewController.m
//  模拟耗时操作
//
//  Created by jyh on 2018/2/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
/**
 1. 循环的速度是非常快
 2. 操作内存的栈控件,速度非常快.
 3. 操作内存的堆控件,速度非常慢.
 4. 循环非常消耗 cpu 的资源
 5. i/o 速度非常慢,操作非常耗时.
 会阻塞主线程.导致 ui 卡死.
 
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 后台执行
//    [self performSelectorInBackground:@selector(demo) withObject:nil];
    //主线程执行
    [self demo];
}

- (void)demo {
    NSLog(@"start");
    for (int i = 0; i < 10000000; i++) {
        NSLog(@"%d",i);
    }
    NSLog(@"end");
}


@end
