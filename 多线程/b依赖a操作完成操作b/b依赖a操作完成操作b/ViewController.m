//
//  ViewController.m
//  b依赖a操作完成操作b
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSOperationQueue *queue;
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

    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载");
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"解压");
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"完成");
    }];
    
    // 设置操作依赖
    // 注意点:要避免循环依赖
    // 依赖关系可以跨队列
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    
    [self.queue addOperations:@[op1,op2] waitUntilFinished:NO];
    
    [[NSOperationQueue mainQueue] addOperation:op3];
    
    
    
}


@end
