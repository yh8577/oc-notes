//
//  ViewController.m
//  模拟get和post登录
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHNetworkTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *passLbl;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation ViewController

- (IBAction)getLogin:(id)sender {
    
    [YHNetworkTool sharedNetworkTool].name = self.userField.text;
    [YHNetworkTool sharedNetworkTool].pwd = self.passField.text;
    
    [[YHNetworkTool sharedNetworkTool] getWithSuccess:^{
        NSLog(@"登录成功");

        [self showLabel];
        [self loadMain];
    } error:^{
        NSLog(@"登录失败");
        self.lbl.text = @"GET 登录失败";
        self.lbl.text = @"POST 登录失败";
        [self loadLogin];
    }];
}

- (IBAction)postLogin:(id)sender {
    
    [YHNetworkTool sharedNetworkTool].name = self.userField.text;
    [YHNetworkTool sharedNetworkTool].pwd = self.passField.text;
   
    [[YHNetworkTool sharedNetworkTool] postWithSuccess:^{
        NSLog(@"登录成功");
        [self showLabel];
        [self loadMain];
    } error:^{
        NSLog(@"登录失败");
        self.lbl.text = @"POST 登录失败";
        [self loadLogin];
    }];
}


- (void)loadLogin {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

- (void)loadMain {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

- (void)showLabel {
    NSString *pwd = [YHNetworkTool sharedNetworkTool].pwd;
    NSString *name = [YHNetworkTool sharedNetworkTool].name;
    self.userField.text = name;
    self.passField.text = pwd;
    self.nameLbl.text = name;
    self.passLbl.text = pwd;
    self.lbl.text = @"POST 登录成功";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
