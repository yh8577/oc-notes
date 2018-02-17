//
//  ViewController.m
//  图片类型的图形上下文
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 开启一个 image 上下文
    // 方法1
//    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    // [UIScreen mainScreen].scale 获取当前屏幕的 @X @1 @2 @3 就是放大的倍数.这样才能保证生成的图片像素和屏幕匹配
    // scale : 如果这个参数传 0 就表示和当前的屏幕的 [UIScreen mainScreen].scale
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, 0);
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextStrokePath(ctx);
    
    // 获取 image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    self.imageView.image = image;
    
    // 关闭
    UIGraphicsEndImageContext();
    
    // image 保存到沙盒
    // 把 image 先转成 NSData, 在保存的沙盒
    NSData *imageData = UIImagePNGRepresentation(image);

    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docPath stringByAppendingPathComponent:@"image1.png"];
    
    NSLog(@"%@",filePath);
    
    [imageData writeToFile:filePath atomically:YES];

}


@end
