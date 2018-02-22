//
//  ViewController.m
//  应用内国际化
//
//  Created by jyh on 2018/2/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,copy)NSString *lan;
@end

@implementation ViewController
- (IBAction)lancn:(id)sender {
    self.lan = @"lan_cn";
}


- (IBAction)lanen:(id)sender {
    self.lan = @"lan_en";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     在工程设置选择 project -> locallzations -> 里面添加一个语言
     新建2个文件名称随意 lan_cn.strings lan_en.strings
     在文件中配置 key 和显示内容
     "title"="提示";
     "message"="消息";
     "commit"="提交";
     NSLocalizedStringFromTable 参数1 key, 参数2 语言文件名称 参数3 提示一般 nil
     NSString *title = NSLocalizedStringFromTable(@"title", self.lan,nil );
     NSString *message = NSLocalizedStringFromTable(@"message", self.lan, nil);
     NSString *commit = NSLocalizedStringFromTable(@"commit", self.lan, nil);
     */
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {

    NSString *title = NSLocalizedStringFromTable(@"title", self.lan,nil );
    NSString *message = NSLocalizedStringFromTable(@"message", self.lan, nil);
    NSString *commit = NSLocalizedStringFromTable(@"commit", self.lan, nil);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:commit style:(UIAlertActionStyleCancel) handler:nil];
    
    
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
