//
//  ViewController.m
//  重力
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
    
    // 注意点: 必须有一个全局的属性引用他,否则在方法执行完成,对象就会被释放了.会导致动画不能执行.
    // 根据一个范围创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 根据行为,创建对应的动力学对象
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    
    // 用角度的形式设置方向
//    gravity.angle = M_PI;
//    // 用向量的方式设置方向
//    gravity.gravityDirection = CGVectorMake(1, 1);
    
    // 量级,落下的速度
    gravity.magnitude = 100;
    
    // 把行为添加到动画对象当中
    [self.animator addBehavior:gravity];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:redView];
    
    self.redView = redView;
}



@end
