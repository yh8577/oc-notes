//
//  ViewController.m
//  获取裁剪过后的图片保存到相册
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
    
    UIImage *image = [UIImage imageNamed:@"1"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, MIN(image.size.width, image.size.height) * 0.5, 0, 2 * M_PI, 1);
    
    CGContextClip(ctx);
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *NewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    self.imageView.image = NewImage;
    
    UIGraphicsEndImageContext();
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(NewImage, self, @selector(image:didFinishSavingWithError:contextInfo:), @"1234");
    
}

// 需要实现下面的方法,或者传入三个参数即可
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"保存失败");
    }else
    {
        NSLog(@"保存成功 == %@",contextInfo);
    }
}


@end
