//
//  ViewController.m
//  模仿imageView
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHImageView.h"
@interface ViewController ()
//@property (nonatomic,weak)UIImageView *imageView;
@property (nonatomic,weak)YHImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //initWithImage 默认 x,y 是0 . w 和 h 就是图片的大小
    YHImageView *imgV = [[YHImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.imageView = imgV;
    [self.view addSubview:imgV];
    
    
    // init 方法 rect 都是0
//    YHImageView *imgV = [[YHImageView alloc] init];
//
//    imgV.frame = CGRectMake(0, 0, 200, 200);
//
//    imgV.image = [UIImage imageNamed:@"1"];
//    self.imageView = imgV;
//
//    [self.view addSubview:imgV];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    int f = 0;
    while (f < 1) {
        f = arc4random_uniform(3);
    }
    
    NSString *str = [NSString stringWithFormat:@"%d", f];
    
    self.imageView.image = [UIImage imageNamed:str];
    
}

@end
