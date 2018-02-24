//
//  ViewController.m
//  NSOperation-最大并发数
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
        // 设置最大并发数
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 20; i++) {
        [self.queue addOperationWithBlock:^{
            NSLog(@"%@",[NSThread currentThread]);
        }];
    }
    
}


@end
