//
//  YHGroupBuyController.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGroupBuyController.h"
#import "UIView+Frame.h"
@interface YHGroupBuyController ()
@property (nonatomic,weak)UIView *blueView;
@end

@implementation YHGroupBuyController

- (UIView *)blueView {
    if (!_blueView) {
        UIView *blueView = [[UIView alloc] init];
        blueView.backgroundColor = [UIColor blueColor];
        blueView.frame = CGRectMake(0, 64, kScreenWidth, 0);
        [self.view addSubview:blueView];
        _blueView = blueView;
    }
    return _blueView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self blueView];
    
}



- (IBAction)groupBuyClick:(UIButton *)sender {
    NSLog(@"aaaaaa");
    NSLog(@"%f",self.blueView.width);
    [UIView animateWithDuration:0.25 animations:^{
        self.blueView.height = self.blueView.height ? 0 : 150;
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
    
}


@end
