//
//  ViewController.m
//  **作为参数对的方法
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    int m,m1;
    [self getMaxAnMin:@[@(100),@(200),@(130),@(150),@(70)] max:&m min:&m1];
    
    NSLog(@"m = %zd m1 = %zd",m ,m1);
    
    NSString *str = nil;
    [self getStr:&str];
    
    NSLog(@"%@",str);
    
}


- (void)getStr:(NSString **)str{
    *str = @"abc";
}

// 计算最大值和最小值
- (void)getMaxAnMin:(NSArray *)array max:(int *)max min:(int *)min {
    
    *max = [array[0] intValue];
    *min = [array[0] intValue];
    for (NSNumber *num in array) {
        if (*max < num.intValue) {
            *max = num.intValue;
        }
        
        if (*min > num.intValue) {
            *min = num.intValue;
        }
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    
}




@end
