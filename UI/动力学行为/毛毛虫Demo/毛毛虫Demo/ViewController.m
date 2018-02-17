//
//  ViewController.m
//  毛毛虫Demo
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)UIView *wormView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UIAttachmentBehavior *att;
@property(nonatomic,strong)NSMutableArray *bodys;
@end

@implementation ViewController

- (NSMutableArray *)bodys {
    if (!_bodys) {
        _bodys = [NSMutableArray array];
    }
    return _bodys;
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    for (int i = 0; i < 9; i++) {
        UIView *wormView = [[UIView alloc] init];
        CGFloat w = 30;
        CGFloat h = w;
        CGFloat x = i * w;
        CGFloat y = 100;
        wormView.frame = CGRectMake(x, y, w, h);
        wormView.layer.cornerRadius = w * 0.5;
        wormView.layer.masksToBounds = YES;
        wormView.backgroundColor = [UIColor redColor];
        self.wormView = wormView;
        
        if (i == 8) {
            wormView.frame = CGRectMake(x, y - h * 0.5, 2 * w, 2 * h);
            wormView.backgroundColor = [UIColor blueColor];
            wormView.layer.cornerRadius = w;
            
            // 添加手势
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            [wormView addGestureRecognizer:pan];
        }
        
        [self.bodys addObject:wormView];
        [self.view addSubview:wormView];
    }

    // 注意点:这里如果使用 self.view.subviews 虽然可以,但是有可能会出现问题,因为系统有可能还会添加其他的控件
    for (int i = 0; i < self.bodys.count - 1; i++) {
        // 附着
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.bodys[i] attachedToItem:self.bodys[i+1]];
        [self.animator addBehavior:attachment];
    }
    
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.bodys];
    [self.animator addBehavior:gravity];
    
    // 碰撞
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.bodys];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    
    CGPoint p = [sender locationInView:self.view];

    if (!self.att) {
        UIAttachmentBehavior *att = [[UIAttachmentBehavior alloc] initWithItem:sender.view attachedToAnchor:p];
        self.att = att;
    }
    
    self.att.anchorPoint = p;
    
    [self.animator addBehavior:self.att];

    // 判断手势
    if (sender.state == UIGestureRecognizerStateEnded) {
        // 移除掉附着
        [self.animator removeBehavior:self.att];
    }
}
@end
