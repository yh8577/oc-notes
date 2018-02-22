//
//  ViewController.m
//  国际化-代码
//
//  Created by jyh on 2018/2/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    /*
     在工程设置选择 project -> locallzations -> 里面添加一个语言
     新建一个文件名称不能错 Localizable.strings
     选中 Localizable.strings 在配置页面  locallzations 点击 locallzations 把语言勾选上.
     选中 Localizable.strings 点击 里面会多出两个 语言文件在对应语言的文件中添加 名称格式如下
     "title"="提示";
     "message"="消息";
     "commit"="提交";
     NSLocalizedString 参数1 key, 参数2 提示一般 nil
     NSString *title = NSLocalizedString(@"title", nil);
     NSString *message = NSLocalizedString(@"message", nil);
     NSString *commit = NSLocalizedString(@"commit", nil);
     */
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {
    
    NSString *title = NSLocalizedString(@"title", nil);
    NSString *message = NSLocalizedString(@"message", nil);
    NSString *commit = NSLocalizedString(@"commit", nil);
    
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
