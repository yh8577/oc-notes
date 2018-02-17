//
//  ViewController.m
//  带圆环的图片
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取图片
    UIImage *image = [UIImage imageNamed:@"3"];
    // 线宽 margin,
    CGFloat margin = 10;
    // 上下文 size
    CGSize size =  CGSizeMake(image.size.width + 2 * margin, image.size.height + 2 * margin);
    // 图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 圆心
    CGPoint arcCenter = CGPointMake(size.width * 0.5, size.height * 0.5);
    // 半径
    CGFloat radius = (MIN(image.size.width, image.size.height) + margin) * 0.5;
    // 绘制外圆
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, radius, 0, 2 * M_PI, 1);
    // 线宽
    CGContextSetLineWidth(ctx, margin);
    // 渲染
    CGContextStrokePath(ctx);
    // 绘制图片圆
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, MIN(image.size.width, image.size.height) * 0.5, 0, 2 * M_PI, 1);
    // 裁剪图片圆心
    CGContextClip(ctx);
    // 绘制圆形图片
    [image drawAtPoint:CGPointMake(margin, margin)];
    // 获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!error) {
        NSLog(@"保存成功");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
