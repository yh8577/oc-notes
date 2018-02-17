//
//  ViewController.m
//  时钟demo
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *second;
@property(nonatomic,strong)CALayer *minute;
@property(nonatomic,strong)CALayer *hour;
@property(nonatomic,assign)CGFloat minuteTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *clock = [[CALayer alloc] init];
    clock.bounds = CGRectMake(0, 0, 200, 200);
    clock.position = CGPointMake(200, 200);
    clock.contents = CFBridgingRelease([UIImage imageNamed:@"2"].CGImage);
    
    clock.cornerRadius = 100;
    clock.masksToBounds = YES;
    
    CALayer *second = [[CALayer alloc] init];
    second.bounds = CGRectMake(0, 0, 2, 80);
    second.position = clock.position;
    second.backgroundColor = [UIColor redColor].CGColor;
    // 锚点
    second.anchorPoint = CGPointMake(0.5, 0.8);
    
    CALayer *minute = [[CALayer alloc] init];
    minute.bounds = CGRectMake(0, 0, 2, 70);
    minute.position = clock.position;
    minute.backgroundColor = [UIColor blueColor].CGColor;
    // 锚点
    minute.anchorPoint = CGPointMake(0.5, 0.8);
    
    CALayer *hour = [[CALayer alloc] init];
    hour.bounds = CGRectMake(0, 0, 2, 60);
    hour.position = clock.position;
    hour.backgroundColor = [UIColor blackColor].CGColor;
    // 锚点
    hour.anchorPoint = CGPointMake(0.5, 0.8);
    
    [self.view.layer addSublayer:clock];
    [self.view.layer addSublayer:second];
    [self.view.layer addSublayer:minute];
    [self.view.layer addSublayer:hour];
    
    self.second = second;
    self.minute = minute;
    self.hour = hour;
    // 方法1
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    // 方法2
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(secondTimeChange)];
    
    // 添加到系统的运行循环中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    [self secondTimeChange];
    [self minuteTimeChange];
    [self hourTimeChange];

}

- (void)hourTimeChange {

    CGFloat angle = 2 * M_PI / 12 ;

    NSDate *date = [NSDate date];
    NSCalendar *calender = [NSCalendar currentCalendar];
    CGFloat time = [calender component:(NSCalendarUnitHour) fromDate:date];
 
    // 数学不行,这行计算.算了一个小时.自己差点绕晕了
    CGFloat offset = time * angle + (self.minuteTime / 12) * (angle / 5);

    self.hour.affineTransform = CGAffineTransformMakeRotation(offset);
}

- (void)minuteTimeChange {
    
    // 旋转角度
    CGFloat angle = 2 * M_PI / 60;

    NSDate *date = [NSDate date];
    NSCalendar *calender = [NSCalendar currentCalendar];
    CGFloat time = [calender component:(NSCalendarUnitMinute) fromDate:date];
    
    if (self.minuteTime == 0 || (time - self.minuteTime) == 12) {
        [self hourTimeChange];
         self.minuteTime = time;
    }
    self.minute.affineTransform = CGAffineTransformMakeRotation(time * angle);
}

- (void)secondTimeChange {
    
    // 1秒钟的旋转角度
    CGFloat angle = 2 * M_PI / 60;
    
    NSDate *date = [NSDate date];
    // 方法1
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"ss";
//    CGFloat time = [[formatter stringFromDate:date] floatValue];
    // 方法2
    NSCalendar *calender = [NSCalendar currentCalendar];
    CGFloat time = [calender component:(NSCalendarUnitSecond) fromDate:date];
    self.second.affineTransform = CGAffineTransformMakeRotation(time * angle);

    if (time == 59) {
        [self minuteTimeChange];
    }
}


@end
