//
//  ViewController1.m
//  TabBarController使用
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s",__func__);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s",__func__);
}

- (void)dealloc {
    
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
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
