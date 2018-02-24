//
//  ViewController.m
//  GCD-并行队列
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

    [self demo2];
}


/**
 并行对列,同步执行, 不会开线程,有顺序执行.
 */
- (void)demo1 {
    // 开启并行队列
    dispatch_queue_t queue = dispatch_queue_create("yh", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d, %@",i ,[NSThread currentThread]);
        });
    }
}


/**
 并行队列,异步执行. 会开多个线程,无序执行.
 */
- (void)demo2 {
    // 开启并行队列
    dispatch_queue_t queue = dispatch_queue_create("yh", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d, %@",i ,[NSThread currentThread]);
        });
    }
}


@end
