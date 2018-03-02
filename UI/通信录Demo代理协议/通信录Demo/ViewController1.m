//
//  ViewController1.m
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"
#import "Tel.h"
@interface ViewController1 ()
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.text1 addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [self.text2 addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [self textChange];
    
    [self.text1 becomeFirstResponder];
}

- (void)textChange {
    
    self.btn.enabled = self.text1.text.length > 0 && self.text2.text.length > 0;
    
}

- (IBAction)btnClick:(id)sender {
    
    if (self.text1.text.length > 0 && self.text2.text.length > 0) {
        if ([self.delegate respondsToSelector:@selector(viewController1:WithTel:)]) {
            
            Tel *tel = [[Tel alloc] init];
            tel.name = self.text1.text;
            tel.tel = self.text2.text;
            [self.delegate viewController1:self WithTel:tel];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
    
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
