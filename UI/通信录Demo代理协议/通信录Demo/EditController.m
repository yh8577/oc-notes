//
//  EditController.m
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "EditController.h"
#import "Tel.h"
@interface EditController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *tell;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation EditController
- (IBAction)editClick:(UIBarButtonItem *)sender {
    
    if (self.btn.hidden) {
        sender.title = @"取消";
        self.name.enabled = YES;
        self.tell.enabled = YES;
        self.btn.hidden = NO;
        [self.name becomeFirstResponder];
    } else {
        sender.title = @"编辑";
        self.name.enabled = NO;
        self.tell.enabled = NO;
        self.btn.hidden = YES;
        self.name.text = self.tel.name;
        self.tell.text= self.tel.tel;
    }

    
}
- (IBAction)btnClick:(id)sender {
    
    //注意点: 这里不需要把模型传回 table 因为这里直接给模型赋值就等于修改了模型. 
    self.tel.name = self.name.text;
    self.tel.tel = self.tell.text;
    
    // 方法1 ,通过代理方法.
    /*
    if ([self.delegate respondsToSelector:@selector(editController:)]) {
        [self.delegate editController:self];
        [self.navigationController popViewControllerAnimated:YES];
    }
     */
    // 方法2: 直接放回,然后在 table 页面的刷新 table
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.name.text = self.tel.name;
    self.tell.text= self.tel.tel;
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
