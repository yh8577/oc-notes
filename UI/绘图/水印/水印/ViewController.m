//
//  ViewController.m
//  水印
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIImage *image = [UIImage imageNamed:@"2"];

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero];
    
    NSString *str = @"huig";
    
    [str drawAtPoint:CGPointMake(120, 120) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:120]}];
    
    UIImage *logoImamge = [UIImage imageNamed:@"logo"];
    
    [logoImamge drawAtPoint:CGPointMake(image.size.width * 0.7, image.size.height * 0.7)];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    
    UIGraphicsEndImageContext();
    
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
