//
//  ViewController.m
//  NSBlockOperation-线程间通信
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
//   [NSOperationQueue currentQueue] 获取当前线程
    [self.queue addOperationWithBlock:^{
        NSLog(@"下载图像, %@",[NSOperationQueue currentQueue]);
        // 回到主队列刷新 ui
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"回到主队列 %@", [NSOperationQueue currentQueue]);
        }];
    }];
    
    
    
    
}


@end
