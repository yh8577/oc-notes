//
//  ViewController.m
//  动力学元素自身属性
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property (nonatomic,weak)UIView *redView;
@property (nonatomic,weak)UIView *blueView;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    
    // 碰撞
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView,self.blueView]];
    
    // 设置bounds为边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 动力学元素自身属性
    
    UIDynamicItemBehavior *itemBechavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.blueView]];
    // 弹力
//    itemBechavior.elasticity = 1;
    
    // 密度
//    itemBechavior.density = 1;
    
    // 摩擦力
    itemBechavior.friction = 2;
    
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
    [self.animator addBehavior:itemBechavior];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    
    self.redView = redView;
    
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(170, self.view.frame.size.height - 50, 50, 50);
    blueView.backgroundColor = [UIColor blueColor];
    
    self.blueView = blueView;
    
    [self.view addSubview:blueView];
    
}


@end
