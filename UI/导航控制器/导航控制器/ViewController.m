//
//  ViewController.m
//  导航控制器
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    
    [self.navigationController pushViewController:vc1 animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
