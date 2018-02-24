//
//  ViewController.m
//  NSOperation-暂停,恢复,取消
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSOperationQueue *queue;
@end

@implementation ViewController
// 开始
- (IBAction)start:(id)sender {
    NSLog(@"开始");
    for (int i = 0; i < 2000; i++) {
        [self.queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d",i);
        }];
    }
}

// 取消
- (IBAction)cancel:(id)sender {
    [self.queue cancelAllOperations];
    NSLog(@"取消");
}

// 暂停
- (IBAction)suspend:(id)sender {
    self.queue.suspended = YES;
    NSLog(@"暂停");
}

// 继续
- (IBAction)resume:(id)sender {
    self.queue.suspended = NO;
    NSLog(@"继续");
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        // 如果想暂停必须设置 最大并发的数. 否则根本暂停不了
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"队列中的操作数 %zd ", self.queue.operationCount);
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"开始");
    for (int i = 0; i < 200; i++) {
        [self.queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d",i);
        }];
    }
    
}


@end
