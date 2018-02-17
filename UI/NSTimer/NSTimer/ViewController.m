//
//  ViewController.m
//  NSTimer
//
//  Created by jyh on 2018/2/2.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*

    注意：
    严格意义上讲 CADisplayLink 并不是计时器控件, 它是与显示器刷新频率一致的。比如显示的刷新频率是60赫兹, 那么 CADisplayLink 就会每秒钟执行60次。正是因为这个原因所以有时也把 CADisplayLink 当做计时器控件来使用。
     
     
     
    // 调用一次执行一次
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    [timer fire];
    [timer fire];
    [timer fire];
    [timer fire];
     */
    
    /*
    // 需要手动添加到 NSRunLoop 中
    // 根据设置的时间,循环调用
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
     */
    
    // 不需要其他操作,创建好后根据设置的时间.循环调用
   NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    // 注意 : repeats 是否重复
    
    
    // 设置 timer 的优先级
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    /*
     FOUNDATION_EXPORT NSRunLoopMode const NSDefaultRunLoopMode;
     FOUNDATION_EXPORT NSRunLoopMode const NSRunLoopCommonModes // 高级别
     */
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
}


- (void)test {
    
    NSLog(@"test");
}


@end
