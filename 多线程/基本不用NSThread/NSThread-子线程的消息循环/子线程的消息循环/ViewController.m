//
//  ViewController.m
//  子线程的消息循环
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
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    
    [thread start];
    
    [self performSelector:@selector(demo1) onThread:thread withObject:nil waitUntilDone:NO ];
    
    
}

- (void)demo1 {
    
    NSLog(@"I'm running = demo1");
    
}

- (void)demo {
    
    NSLog(@"I'm running");
    
    //如果用这种方式消息循环会一直执行
//    [[NSRunLoop currentRunLoop] run];
    
    // 在设置时间后结束循环
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    NSLog(@"end");
    
}


@end
