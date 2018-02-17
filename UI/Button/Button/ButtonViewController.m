//
//  ButtonViewController.m
//  Button
//
//  Created by jyh on 2018/1/30.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setButton];
}


- (void)setButton{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    

    [btn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateHighlighted];
    
    [btn setTitle:@"点我呀" forState:UIControlStateNormal];
    [btn setTitle:@"点轻点" forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];

    
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}


- (void)clickBtn:(UIButton *)sender {
    
    NSLog(@"点中了");
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
