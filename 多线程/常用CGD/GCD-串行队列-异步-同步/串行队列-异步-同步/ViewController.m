//
//  ViewController.m
//  串行队列-异步-同步
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
    
    [self demo1];
    [self demo2];

}


/**
 串行队列,异步执行 , 会开启新线程,任务是按顺序执行
 */
- (void)demo2 {
    dispatch_queue_t queue = dispatch_queue_create("yh", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"异步执行 %d = %@",i, [NSThread currentThread]);
        });
    }
}

/**
 串行队列,同步执行 , 不会开启新线程,任务是按顺序执行.
 */
- (void)demo1 {
    dispatch_queue_t queue = dispatch_queue_create("yh", DISPATCH_QUEUE_SERIAL);
   
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"同步执行 %d = %@",i, [NSThread currentThread]);
        });
    }
}



@end
