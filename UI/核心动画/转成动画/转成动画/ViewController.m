//
//  ViewController.m
//  转成动画
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property(nonatomic,assign)NSInteger imageName;

@end

@implementation ViewController


// 轻扫手势方法
- (IBAction)imageChange:(UISwipeGestureRecognizer *)sender {
    
    self.imageName ++;
    if (self.imageName == 4) {
        self.imageName = 0;
    }
    
    CATransition *anim = [[CATransition alloc] init];
    
    // 动画类型
    anim.type = @"cube";
    
    self.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.imageName + 1]];
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"右往左");
        // 方向
        anim.subtype = kCATransitionFromRight;
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"左往右");
        // 方向
        anim.subtype = kCATransitionFromLeft;
    }
    
    
    [self.imageV.layer addAnimation:anim forKey:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageName = 0;
}


@end
