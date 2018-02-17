//
//  OrangeViewController.m
//  storyboard创建的导航控制器
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "OrangeViewController.h"

@interface OrangeViewController ()

@end

@implementation OrangeViewController
- (IBAction)btn1:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (IBAction)btn2:(id)sender {
    
    NSArray *arrVC = self.navigationController.viewControllers;
    
    UIViewController *bule = arrVC[1];
    
    [self.navigationController popToViewController:bule animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
