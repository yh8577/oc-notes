//
//  ViewController.m
//  subviews 和 superview
//
//  Created by jyh on 2018/1/30.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
- (IBAction)tagBtn;
- (IBAction)delete;

@property (weak, nonatomic) IBOutlet UISegmentedControl *first;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)show:(id)sender {
    
    // 获取所有当前控制器的所有子控件
    
//    for (UIView *view in self.view.subviews) {
//
//        view.backgroundColor = [UIColor redColor];
//    }
    
    // 获取父控件
    self.text1.superview.backgroundColor = [UIColor blueColor];
    self.sw1.superview.backgroundColor = [UIColor grayColor];
    

    
}
- (IBAction)tagBtn {
    
    // 通过 tag 拿到一个控件
    UITextField *txt = (UITextField*)[self.view viewWithTag:1000];
    
    txt.text = @"通过 tag 拿到控件";
}

- (IBAction)delete {
    
    // 删除所有子控件
    while (self.view.subviews.firstObject) {
        [self.view.subviews.firstObject removeFromSuperview];
    }
    
}
@end
