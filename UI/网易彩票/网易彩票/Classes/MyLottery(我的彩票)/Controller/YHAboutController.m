//
//  YHAboutController.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHAboutController.h"
#import "YHAboutHeaderView.h"
@interface YHAboutController ()

@end

@implementation YHAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [YHAboutHeaderView aboutHeaderView];
}



@end
