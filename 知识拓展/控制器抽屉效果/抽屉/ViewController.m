//
//  ViewController.m
//  抽屉
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)leftSwipe:(id)sender {
    self.topConstraint.constant = 0;
    self.bottomConstraint.constant = 0;
    self.widthConstraint.constant = self.view.bounds.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)rightSwipe:(id)sender {
    self.topConstraint.constant = 40;
    self.bottomConstraint.constant = 40;
    self.widthConstraint.constant = 150;
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
