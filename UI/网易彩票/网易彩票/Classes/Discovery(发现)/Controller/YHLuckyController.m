//
//  YHLuckyController.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHLuckyController.h"

@interface YHLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YHLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.animationImages = @[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]];
    
    self.imageView.animationDuration = 1;
    
 
    
    [self.imageView startAnimating];
    
    
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
