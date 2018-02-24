//
//  ViewController.m
//  GCD- 主队列-同步异步执行
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

    [self demo3];
}


/**
 主队列,异步执行. 有序的.不会开线程
 先执行主线程上的代码,在执行主线程的任务.
 */
- (void)demo1{
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%d, %@",i , [NSThread currentThread]);
        });
    }
    
}
/**
 主队列,同步执行 - > 如果在主线程会死锁
 */
- (void)demo2{
//    for (int i = 0; i < 10; i++) {
//        // 死锁
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"%d, %@",i , [NSThread currentThread]);
//        });
//    }
}

// 解决死锁
- (void)demo3{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            // 死锁
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSLog(@"%d, %@",i , [NSThread currentThread]);
            });
        }
    });
    
}


@end
