//
//  ViewController.m
//  Button
//
//  Created by jyh on 2018/1/30.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *dwBtn;
- (IBAction)move:(UIButton *)sender;


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



- (IBAction)move:(UIButton *)sender {
    
//    NSLog(@"%ld",(long)sender.tag);

    CGRect rect = self.dwBtn.frame;
    
    // center 修改 x, y
    /*
    CGPoint center = self.dwBtn.center;
    // center 注意点,只能修改 x,y. 不能修改宽高
     */
    CGRect bounds = self.dwBtn.bounds;
    // bounds 注意点,只能修改哦宽高,无法修改 x, y 的值.
    // bounds 和 frame 放大缩小的区别 bounds 中心点不变.
    switch (sender.tag) {
        case 3:
            rect.origin.y -= 100;

//            center.y -= 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
            
        case 4:
            rect.origin.y += 100;
//            center.y += 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
         
        case 1:
            rect.origin.x -= 100;
//            center.x -= 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
            
        case 2:
            rect.origin.x += 100;

//            center.x += 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
            
        case 5:
//            rect.size.width += 10;
//            rect.size.height += 10;
            bounds.size.width += 100;
            bounds.size.height += 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
        
        case 6:
//            rect.size.width -= 10;
//            rect.size.height -= 10;
//            self.dwBtn.frame = rect;
            bounds.size.width -= 100;
            bounds.size.height -= 100;
            NSLog(@"~~~~~~~~~~~~");
            break;
    }
    
    // block 式动画
    [UIView animateWithDuration:1.0 animations:^{
        self.dwBtn.frame = rect;
//        self.dwBtn.center = center;
        self.dwBtn.bounds = bounds;
    }];
    
    
    // 头尾式动画
    /*
    // 开启动画
    [UIView beginAnimations:nil context:nil];
    // 设置动画
    [UIView setAnimationDuration:2];
//            self.dwBtn.frame = rect;
        self.dwBtn.center = center;
        self.dwBtn.bounds = bounds;
   //提交动画
    [UIView commitAnimations];
     */
}

@end
