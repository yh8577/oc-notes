//
//  ViewController.m
//  NSInvocationOperation简单使用
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
    
    //方法2
    // 更新操作,调用 main 方法
    // 在主线程执行, 只会执行一次
    //    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(demo) object:nil];
    //    [op start];
    
    // 方法1
    // 子线程执行.
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(demo) object:nil];
    // 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 把操作添加到队列
    [queue addOperation:op];
    
}

- (void)demo {
    
    NSLog(@"%@",[NSThread currentThread]);
}

@end
