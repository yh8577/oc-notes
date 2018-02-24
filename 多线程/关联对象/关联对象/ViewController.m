//
//  ViewController.m
//  关联对象
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+myImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    
    imageV.urlString = @"asdf";
    
    NSLog(@"%@",imageV.urlString);
    
    
}


@end
