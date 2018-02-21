//
//  ArenaTableController.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ArenaTableController.h"

@interface ArenaTableController ()

@end

@implementation ArenaTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = CFBridgingRelease([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:(UIBarMetricsDefault)];
    
    // 获取 titleView
    UISegmentedControl *seg = (UISegmentedControl*)self.navigationItem.titleView;
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];

    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:(UIControlStateNormal)];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:(UIControlStateSelected)];
    
    [seg setTintColor:[UIColor clearColor]];

}



@end
