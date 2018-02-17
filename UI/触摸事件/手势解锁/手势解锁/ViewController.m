//
//  ViewController.m
//  手势解锁
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "QDView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet QDView *passwordView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    
    self.passwordView.passwordBlock = ^(NSString *pwd) {
        self.passwordLbl.text = pwd;
        if ([pwd isEqualToString:@"12357896"]) {
            return YES;
        }else {
            return NO;
        }
    };
}


@end
