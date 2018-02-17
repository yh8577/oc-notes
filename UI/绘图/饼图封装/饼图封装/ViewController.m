//
//  ViewController.m
//  饼图封装
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "PieChart.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PieChart *pv = [PieChart pieChartView];
    
    [self.view addSubview:pv];
    
    pv.frame = CGRectMake(100, 100, 300, 200);
    
    pv.values = @[@0.3,@0.1,@0.2,@0.4];
    
}


@end
