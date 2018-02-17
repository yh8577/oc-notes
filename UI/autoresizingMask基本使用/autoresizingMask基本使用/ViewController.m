//
//  ViewController.m
//  autoresizingMask基本使用
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak)UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *blueV = [[UIView alloc] init];
    blueV.frame = CGRectMake(0, 0, 200, 200);
    blueV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueV];
    self.blueView = blueV;
    
    UIView *redV = [[UIView alloc] init];
    redV.backgroundColor = [UIColor redColor];
    CGFloat redW = blueV.frame.size.width;
    CGFloat redH = 50;
    CGFloat redX = blueV.frame.origin.x;
    CGFloat redY = blueV.frame.size.height - redH;
    redV.frame = CGRectMake(redX, redY, redW, redH);
    [blueV addSubview:redV];
    
    redV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    /*
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     */
    
}

- (IBAction)btnClick:(id)sender {
    
    CGRect rect = self.blueView.frame;
    rect.size.width += 20;
    rect.size.height += 20;
    self.blueView.frame = rect;
    
}

@end
