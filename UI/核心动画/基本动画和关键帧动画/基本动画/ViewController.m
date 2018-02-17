//
//  ViewController.m
//  基本动画
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
    
    // 关键帧动画
    CAKeyframeAnimation *anim = [[CAKeyframeAnimation alloc] init];
    
    anim.keyPath = @"position";
    
    // values ---------------
//    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
//    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
//    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//
//    anim.values = @[v1,v2,v3,v4];
    // values ----------------
    // 动画时间

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];
    
    anim.path = path.CGPath;
    
    anim.duration = 2;
    
    // 重复次数
    anim.repeatCount = INT_MAX; //INT_MAX 无穷大
    
    [self.layer addAnimation:anim forKey:nil];
}

- (void)test1 {
    // 基本动画
    // 创建动画对象
    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
    
    // 怎么做
    anim.keyPath = @"position.x";
    //    // 从哪里开始
    //    anim.fromValue = @(10);
    //    // 移动到哪里
    //    anim.toValue = @(300);
    
    // 在自身的基础上移动多少
    anim.byValue = @(20);
    
    // 注意点:核心动画做完以后会回到原点
    // 如果不希望回到原点
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    // 添加动画(对谁做动画)
    [self.layer addAnimation:anim forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 20, 20);
    
    redView.backgroundColor = [UIColor redColor];
    self.layer = redView.layer;
    [self.view addSubview:redView];
}




@end
