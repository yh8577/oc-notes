//
//  ViewController3.m
//  导航控制器
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController3.h"
#import "ViewController1.h"
@interface ViewController3 ()

@end

@implementation ViewController3
- (IBAction)btn1:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (IBAction)btn2:(id)sender {
    
    
    // 注意点,返回指定的控制器必须是 self.navigationController.viewControllers 数组中的控制器.不能是新创建的.
    NSArray *arrVC =  self.navigationController.viewControllers;
    ViewController1 *vc1 = arrVC[1];
    
    [self.navigationController popToViewController:vc1 animated:YES];
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
