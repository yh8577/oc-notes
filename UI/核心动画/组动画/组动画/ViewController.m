//
//  ViewController.m
//  组动画
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)CALayer *layer;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 组动画
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
    // 基本动画 ---------------
    // 创建动画对象
    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
    
    // 怎么做
    anim.keyPath = @"transform.rotation";
    
    anim.byValue = @(2 * M_PI * 5);
    // 基本动画 ---------------
    
    // 关键帧动画 -------------
    CAKeyframeAnimation *anim1 = [[CAKeyframeAnimation alloc] init];
    
    anim1.keyPath = @"position";
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];
    
    anim1.path = path.CGPath;
    // 关键帧动画 -------------
    
    group.animations = @[anim,anim1];
    
    // 组动画的动画执行时间和次数需要改组动画的属性
    group.duration = 3;
    group.repeatCount = INT_MAX;
    
    [self.layer addAnimation:group forKey:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 20, 20);
    
    [self.view addSubview:redView];
    self.layer = redView.layer;
}


@end
