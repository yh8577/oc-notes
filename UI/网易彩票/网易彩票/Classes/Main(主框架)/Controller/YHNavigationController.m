//
//  YHNavigationController.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNavigationController.h"

@interface YHNavigationController ()

@end

@implementation YHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];

}

@end
