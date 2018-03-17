//
//  ViewController.m
//  附着行为-item和item之间
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController.h"

@interface BGView : UIView
@property(nonatomic,assign)CGPoint start;
@property(nonatomic,assign)CGPoint end;

@end

@implementation BGView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *patn = [UIBezierPath bezierPath];
    
    [patn moveToPoint:self.start];
    [patn addLineToPoint:self.end];
    
    [patn stroke];
}

@end

@interface ViewController ()
@property (nonatomic,weak)UIView *redView;
@property (nonatomic,weak)UIView *blueView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UIAttachmentBehavior *attach;
@end

@implementation ViewController

- (void)loadView {
    
    self.view = [[BGView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.attach = [[UIAttachmentBehavior alloc] initWithItem:self.redView attachedToItem:self.blueView];
    
    // 固定杆的长度
    //    self.attach.length = 100;
    
    // 降幅
    //    self.attach.damping = 0.5;
    
    // 弹性频率
    self.attach.frequency = 0.5;
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    
    [self.animator addBehavior:self.attach];
    [self.animator addBehavior:gravity];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(250,100, 100, 100);
    blueView.backgroundColor = [UIColor blueColor];
    self.blueView = blueView;
    [self.view addSubview:blueView];
}


@end
