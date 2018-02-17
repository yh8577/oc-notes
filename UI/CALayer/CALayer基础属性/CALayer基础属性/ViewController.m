//
//  ViewController.m
//  CALayer基础属性
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // CALayer transform 属性
    CALayer *layer = [[CALayer alloc] init];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = CGPointMake(200, 200);
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.contents = CFBridgingRelease([UIImage imageNamed:@"6"].CGImage);

    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 旋转
//    self.layer.transform  = CATransform3DRotate(self.layer.transform, M_PI_4, 0, 0, 1);
    
    // 缩放 , 2d图形 z 轴无效
//    self.layer.transform = CATransform3DScale(self.layer.transform, 0.5, 0.5, 1);
    
    // 平移 , 2d图形 z 轴无效
    self.layer.transform = CATransform3DTranslate(self.layer.transform, 10, 0, 0);
}


- (void)test {
    
    // CALayer 属性
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    
    // 边框
    redView.layer.borderWidth = 10; // 宽度
    redView.layer.borderColor = [UIColor grayColor].CGColor; //颜色
    
    // 阴影
    redView.layer.shadowOffset = CGSizeZero; //偏移
    redView.layer.shadowColor = [UIColor blueColor].CGColor; // 颜色
    redView.layer.shadowRadius = 50; // 半径
    redView.layer.shadowOpacity = 1; // 透明度, 默认0 全透明,看不到.
    
    // 圆角
    redView.layer.cornerRadius = 50; // 圆角半径
    redView.layer.masksToBounds = YES; // 超出父控件不显示. 如果没有设置可能会感觉没有效果.
    
    // bounds 注意点.不要去设置 layer 的 frame ,因为设置的时候没有问题.但是在后面去 frame 的时候可能会出现问题
    redView.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // position
    //redView.layer.position = CGPointMake(0, 0); // 控件的中心点位置在父控件的坐标系的位置
    
    // 设置内容(图片)
    redView.layer.contents = CFBridgingRelease([UIImage imageNamed:@"6"].CGImage);
    
    [self.view addSubview:redView];
}


@end
