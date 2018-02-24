//
//  ViewController.m
//  优先级
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
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<20; i++) {
            NSLog(@"op1 = %d ",i);
        }
    }];
    [self.queue addOperation:op1];
    op1.qualityOfService = NSQualityOfServiceUserInteractive;
    [op1 setCompletionBlock:^{
        NSLog(@"op1 完成 %@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<20; i++) {
            NSLog(@"op2 = %d",i);
        }
    }];
    [self.queue addOperation:op2];
    op2.qualityOfService = NSQualityOfServiceBackground;
    
}


@end
