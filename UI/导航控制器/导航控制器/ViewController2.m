//
//  ViewController2.m
//  导航控制器
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController2 ()

@end

@implementation ViewController2
- (IBAction)close:(id)sender {
    
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    
    [self.navigationController pushViewController:vc3 animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
