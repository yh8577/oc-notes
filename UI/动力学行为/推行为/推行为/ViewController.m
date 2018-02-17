//
//  ViewController.m
//  推行为
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)UIView *redView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    
    CGPoint p = [t locationInView:t.view];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 推行为
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.redView] mode:(UIPushBehaviorModeInstantaneous)];
    
    // 推力
//    push.magnitude = 1;
    
    // 推动方向
    // 按角度
//    push.angle = M_PI;
    
    CGFloat offsetX = ( p.x - self.redView.center.x) / 50;
    CGFloat offsetY = ( p.y - self.redView.center.y) / 50;
    
    // 按向量
    push.pushDirection = CGVectorMake(offsetX, offsetY);
    
    [self.animator addBehavior:push];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    [self.view addSubview:redView];
}


@end
