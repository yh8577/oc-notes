//
//  ViewController.m
//  Transform
//
//  Created by jyh on 2018/1/30.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)dwBtn:(UIButton *)sender;
- (IBAction)move:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *dwBtn;


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


- (IBAction)dwBtn:(UIButton *)sender {
    
    NSLog(@"点我干啥");
}

- (IBAction)move:(UIButton *)sender {
    
    NSLog(@"%ld",(long)sender.tag);
    
    
    CGAffineTransform transform = self.dwBtn.transform;
    CGAffineTransform newTransform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
    
    switch (sender.tag) {
        case 1:

            newTransform = CGAffineTransformTranslate(transform, 0, 50);
            break;
        case 2:
            newTransform = CGAffineTransformRotate(transform, M_PI_4);
            break;
        case 3:
            newTransform = CGAffineTransformScale(transform, 1.5, 1.5);
            break;
    }
    

    [UIView animateWithDuration:1.0 animations:^{
        // 平移
        //self.dwBtn.transform = CGAffineTransformMakeTranslation(0, transform.ty - 50);
        // 基于旧的值平移
        //        self.dwBtn.transform = CGAffineTransformTranslate(transform, 0, 50);
        // 缩放
        //        self.dwBtn.transform = CGAffineTransformMakeScale(1.5, 1.5);
        // 基于原来的缩放
        //        self.dwBtn.transform = CGAffineTransformScale(transform, 1.5, 1.5);
        // 旋转
        //        self.dwBtn.transform = CGAffineTransformMakeRotation(M_PI_4); // 旋转45度
        // 基于原来的值旋转
        //        self.dwBtn.transform = CGAffineTransformRotate(transform, M_PI_4);
        // 回到原始的值
        //        self.dwBtn.transform = CGAffineTransformIdentity;
        
        self.dwBtn.transform = newTransform;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.dwBtn.transform = CGAffineTransformIdentity;
        }];
    }];
    
    
    
}
@end
