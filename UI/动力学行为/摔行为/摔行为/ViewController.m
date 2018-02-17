//
//  ViewController.m
//  摔行为
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
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:p];
    
    snap.damping = 0;
    
    [self.animator addBehavior:snap];


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
