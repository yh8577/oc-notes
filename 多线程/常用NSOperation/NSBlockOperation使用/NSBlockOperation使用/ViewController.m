//
//  ViewController.m
//  NSBlockOperation使用
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSOperationQueue *queue; // 创建一个全局队列
@end

@implementation ViewController

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    
}

- (void)demo6 {
    
    // 创建任务
    NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    // 任务执行完成后执行
    [bop setCompletionBlock:^{
        NSLog(@"执行完成");
    }];
    
    // 添加到队列
    [self.queue addOperation:bop];
}

- (void)demo5 {
    for (int i = 0; i < 10; i++) {
        [self.queue addOperationWithBlock:^{
            NSLog(@"%d, %@", i, [NSThread currentThread]);
        }];
    }
}


- (void)demo4 {
    
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        // 创建任务
        NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"任务 %d, %@",i,[NSThread currentThread]);
        }];
        [arrM addObject:bo];
    }
    
    [queue addOperations:arrM waitUntilFinished:YES];
}

- (void)demo3 {
    // 方法3
    // 在子线程执行
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

- (void)demo2 {
    // 方法2
    // 在子线程执行
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 创建任务
    NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    // 添加到队列
    [queue addOperation:bo];
}


- (void)demo1 {
    
    // 方法1
    // 在线程执行
    NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    [bop start];
}
@end
