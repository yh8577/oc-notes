//
//  ViewController1.m
//  storyboard传值
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UILabel *lbl;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl.text = _text;
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
