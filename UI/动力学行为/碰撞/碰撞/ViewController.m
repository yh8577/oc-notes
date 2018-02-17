//
//  ViewController.m
//  碰撞
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
    
    // 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView]];
    
    // 把引用的 view 的 bounds 变成边界和 redView 发生碰撞
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 把行为添加到动画对象当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
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
