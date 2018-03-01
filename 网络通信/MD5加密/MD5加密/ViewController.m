//
//  ViewController.m
//  MD5加密
//
//  Created by jyh on 2018/2/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MD5.h"
#import "CocoaSecurity.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"123";
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYYMMddHHmm";
    NSString *strdate = [formatter stringFromDate:date];

    NSLog(@"%@",[str md5]);
    
}


@end
