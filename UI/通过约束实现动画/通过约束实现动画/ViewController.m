//
//  ViewController.m
//  通过约束实现动画
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blueConstraintY;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)BtnClick:(id)sender {
    
    if (self.blueConstraintY.constant < self.view.frame.size.height) {
        self.blueConstraintY.constant += 100;
    } else {
        self.blueConstraintY.constant = 0;
    }
    
    [UIView animateWithDuration:1.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
