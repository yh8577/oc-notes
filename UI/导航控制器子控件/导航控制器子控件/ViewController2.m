//
//  ViewController2.m
//  导航控制器子控件
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
- (IBAction)btn1:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (IBAction)btn2:(id)sender {
    
    NSArray *arrVC = self.navigationController.viewControllers;
    
    
    [self.navigationController popToViewController:arrVC[1] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
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
