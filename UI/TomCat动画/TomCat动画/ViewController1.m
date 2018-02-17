//
//  ViewController1.m
//  TomCat动画
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setView];
    
}

- (void)setView{
    
    [self setIimageView];
    
    CGRect rect1 = CGRectMake(20, self.view.frame.size.height - 200, 60, 30);
    _btn1 = [self setButtonWithFrame:rect1 andAction:@selector(btn1Click1) andTitlle:@"btn1"];
    
    rect1.origin.y += 50;
    _btn2 = [self setButtonWithFrame:rect1 andAction:@selector(btn1Click2) andTitlle:@"btn2"];
    
    rect1.origin.y += 50;
    _btn3 = [self setButtonWithFrame:rect1 andAction:@selector(btn1Click3) andTitlle:@"btn3"];
}

- (void)btn1Click1{
    
    NSLog(@"btn1Click");
    
    [self setAnimatingsWithCount:22 andName:@"look"];
    
}

- (void)btn1Click2{
    
    NSLog(@"btn2Click");
    [self setAnimatingsWithCount:25 andName:@"breath"];
}

- (void)btn1Click3{
    
    NSLog(@"btn3Click");
    [self setAnimatingsWithCount:28 andName:@"paper_bag"];
}


- (void)setAnimatingsWithCount:(int)count andName:(NSString*)name {
    
    if (self.imageView.isAnimating) {
        return;
    }
    
    NSString *str = [NSString stringWithFormat:@"Animations/%@",name];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:nil];
    NSMutableArray *arrayMImg = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imgStr = [NSString stringWithFormat:@"%@/%04d.jpg",path,i];
        UIImage *img = [UIImage imageWithContentsOfFile:imgStr];
        [arrayMImg addObject:img];
    }
    
    NSTimeInterval duration = arrayMImg.count * 0.1;
    self.imageView.animationImages = arrayMImg;
    self.imageView.animationDuration = duration;
    self.imageView.animationRepeatCount = 1;
    [self.imageView startAnimating];
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:duration];
}


- (UIButton *)setButtonWithFrame:(CGRect)frame andAction:(SEL)action andTitlle:(NSString *)title {
    
    UIButton *btn  = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn sizeToFit];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    return btn;
}


- (void)setIimageView{
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0000"]];
    self.imageView.frame = self.view.bounds;
    [self.view addSubview:self.imageView];
    
}

@end
