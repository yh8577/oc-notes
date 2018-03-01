//
//  ViewController.m
//  base64
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Base64.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *str = @"123";
    NSString *str64 = [str base64Endcode];
    
    NSLog(@"%@",str64);

    NSLog(@"%@",[str64 base64Decode]);
}

////加密
//- (NSString *)base64Endcode:(NSString *)str {
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    return [data base64EncodedStringWithOptions:0];
//}
//
////解码
//- (NSString *)base64Decode:(NSString *)str {
//    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
//    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//}


@end
