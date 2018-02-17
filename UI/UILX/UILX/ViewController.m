//
//  ViewController.m
//  UILX
//
//  Created by jyh on 2018/1/29.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *jieguo;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    
}


- (IBAction)jieguoBtn:(id)sender {
    
    double t1 = self.num1.text.doubleValue;
    
    double t2 = self.num2.text.doubleValue;

    // 让第一响应者辞职,就可以回收键盘
//    [self.num1 resignFirstResponder];
//    [self.num2 resignFirstResponder];
    
    // 当前的 View 去 回收键盘.
    [self.view endEditing:YES];
    
    NSString *str = [NSString stringWithFormat:@"%.2f",t1+t2];
    
    self.jieguo.text = str;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
