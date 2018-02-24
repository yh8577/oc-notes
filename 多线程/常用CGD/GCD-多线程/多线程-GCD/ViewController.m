//
//  ViewController.m
//  多线程-GCD
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
    
    
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    // 方法1
    /*
    // 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 创建任务
    dispatch_block_t task = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    // 异步执行
    dispatch_async(queue, task);
    */
    
    // 方法2
    /*
    // 异步执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
     */
    
    // 同步执行
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}


@end
