//
//  ViewController.m
//  GCD-延迟执行和一次性执行
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    });

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 延迟执行
    // DISPATCH_TIME_NOW // 在当前的时间基础
    // (int64_t)(1 * NSEC_PER_SEC) // 延迟时间
    // dispatch_get_main_queue() 队列
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//
//    });
    
    // 一次性执行
    // 在当前线程执行
    // 特点是不管调用多少次,只会执行一次
//    for (int i = 0; i < 2000; i++) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSLog(@"%@",[NSThread currentThread]);
//        });
//    }
    
}


@end
