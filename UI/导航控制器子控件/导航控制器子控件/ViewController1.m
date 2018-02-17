//
//  ViewController1.m
//  导航控制器子控件
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"VC1";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:(UIBarButtonItemStyleDone) target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem = item;
    
    
    // 覆盖系统的返回按钮
    UIBarButtonItem *itemBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(colse)];
   
    self.navigationItem.leftBarButtonItem = itemBack;
}

- (void)colse {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)click {
    
    UIStoryboard *strVC = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *stVC = [strVC instantiateViewControllerWithIdentifier:@"label"];
    [self.navigationController pushViewController:stVC animated:YES];
    
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
