//
//  ViewController.m
//  摇奖机demo
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl3;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property(nonatomic,strong)NSOperationQueue *queue;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%zd",self.queue.operationCount);
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 3;
    }
    return _queue;
}

- (IBAction)start:(UIButton *)sender {
    
    if (self.queue.operationCount == 0) {
        self.queue.suspended = NO;
        [self.queue addOperationWithBlock:^{
            [self random];
        }];
        [self.startButton setTitle:@"暂停" forState:(UIControlStateNormal)];
        NSLog(@"开始");
    } else if(!self.queue.isSuspended) {
        self.queue.suspended = YES;
        [self.startButton setTitle:@"开始" forState:(UIControlStateNormal)];
        NSLog(@"暂停");
    }
}

- (void)random {
    NSLog(@"%d",self.queue.isSuspended);
        while (!self.queue.isSuspended) {
            [NSThread sleepForTimeInterval:0.05];
            int num1 = arc4random_uniform(10);
            int num2 = arc4random_uniform(10);
            int num3 = arc4random_uniform(10);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.lbl1.text = [NSString stringWithFormat:@"%d",num1];
                self.lbl2.text = [NSString stringWithFormat:@"%d",num2];
                self.lbl3.text = [NSString stringWithFormat:@"%d",num3];
            }];
        }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
