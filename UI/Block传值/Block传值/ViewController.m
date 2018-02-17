//
//  ViewController.m
//  Block传值
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation ViewController


// 注意点:只能使用其一,如果 Storyboard 拖线这里就无法使用
//代码跳转方法
//- (IBAction)btn:(id)sender {
//
//    ViewController1 *vc1 = [[ViewController1 alloc] init];
//
//    vc1.strBlock = ^(NSString * str) {
//
//        self.lbl.text = str;
//    };
//
//    [self.navigationController pushViewController:vc1 animated:YES];
//}

// 拖线跳转方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    ViewController1 *vc1 = segue.destinationViewController;
    
    vc1.strText = self.lbl.text;
    
    vc1.strBlock = ^(NSString * str) {

        self.lbl.text = str;
    };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lbl.text = @"顺传";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
