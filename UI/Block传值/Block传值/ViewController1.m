//
//  ViewController1.m
//  Block传值
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation ViewController1



- (IBAction)btn:(id)sender {
    
    if (self.strBlock) {
        NSLog(@"aaa");
        self.strBlock(self.text.text);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.text.text = self.strText;
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
