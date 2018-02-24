//
//  ViewController.m
//  GCD-调度组
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
    
    [self demo2];
}

- (void)demo2 {
    
    // 调度组内部原理
    dispatch_group_t group = dispatch_group_create();
    // 裁剪队列
    dispatch_queue_t queue = dispatch_queue_create("YH", DISPATCH_QUEUE_CONCURRENT);
    // 加入组
    dispatch_group_enter(group);
    // 任务1
    dispatch_async(queue, ^{
        NSLog(@"任务1 ");
        // 退出组
        dispatch_group_leave(group);
    });
    // 加入组
    dispatch_group_enter(group);
    // 任务2
    dispatch_async(queue, ^{
        NSLog(@"任务2 ");
        // 退出组
        dispatch_group_leave(group);
    });
    // 加入组
    dispatch_group_enter(group);
    // 任务3
    dispatch_async(queue, ^{
        NSLog(@"任务3 ");
        // 退出组
        dispatch_group_leave(group);
    });
    
    // 返回主线程 - dispatch_get_main_queue()
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"任务执行完成");
    });
    
}

- (void)demo1 {
    // 基本使用 这个方法
    // 创建组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载1 , %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载2, %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载3, %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载4, %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载5, %@",[NSThread currentThread]);
    });
    
    // 执行完成返回主线程执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"执行完成, %@",[NSThread currentThread]);
    });
    

}


@end
