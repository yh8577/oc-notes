//
//  ViewController.m
//  获取硬件信息
//
//  Created by jyh on 2018/2/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "SystemServices.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SystemServices *sys = [SystemServices sharedServices];
    
    self.textView.text = [sys.allSystemInformation description];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
