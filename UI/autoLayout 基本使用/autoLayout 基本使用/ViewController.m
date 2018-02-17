//
//  ViewController.m
//  autoLayout 基本使用
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    // 注意这里必须禁用 Autoresizing
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *blueH = [NSLayoutConstraint constraintWithItem:blueView attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:50];
    [blueView addConstraint:blueH];
    
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blueView attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:blueView.superview   attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:30];
    [self.view addConstraint:blueTop];
    
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:blueView.superview   attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:30];
    [self.view addConstraint:blueLeft];
    
    NSLayoutConstraint *blueRight = [NSLayoutConstraint constraintWithItem:blueView attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:blueView.superview   attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-30];
    [self.view addConstraint:blueRight];
    
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 注意这里必须禁用 Autoresizing
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *redH = [NSLayoutConstraint constraintWithItem:redView attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:50];
    [redView addConstraint:redH];
    
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:redView attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:blueView attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:20];
    [self.view addConstraint:redTop];
    
    NSLayoutConstraint *redLeft = [NSLayoutConstraint constraintWithItem:redView attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:blueView attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:0];
    [self.view addConstraint:redLeft];
    
    NSLayoutConstraint *redRight = [NSLayoutConstraint constraintWithItem:redView attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:blueView attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:0];
    [self.view addConstraint:redRight];
    
    
}


@end
