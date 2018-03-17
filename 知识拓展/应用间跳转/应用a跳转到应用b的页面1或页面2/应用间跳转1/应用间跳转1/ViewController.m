//
//  ViewController.m
//  应用间跳转1
//
//  Created by jyh on 2018/3/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)test1 {
    
    NSString *shareURLStr = nil;
    
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    NSArray *urlTypeArray = infoDict[@"CFBundleURLTypes"];
//    CFBundleURLSchemes
    for (NSDictionary *schemeDict in urlTypeArray) {
        NSArray *schemeArr = schemeDict[@"CFBundleURLSchemes"];
        NSString *schemeStr = schemeArr[0];
        if ([schemeStr isEqualToString:@"weixinApp"]) {
            shareURLStr = [NSString stringWithFormat:@"weiboApp://shouye.weixinApp"];
        }
    }
    
    [self openURLWithString:shareURLStr];
    
}

- (void)openURLWithString:(NSString *)urlStr {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}


- (IBAction)tiaoz1:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weiboApp://pengyouquan"]];
    
}


- (IBAction)tiaoz:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weiboApp://shouye"]];
}

- (void)test {
    
    // targets -> info -> urlTypes -> url schemes 添加协议头
    
    // canOpenURL ios9 以下可以这样写. ios9 以后会报错.
    // if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weiboApp://"]]) {   }
    // 解决办法在 info 添加白名单格式如下
    /*
     <key>LSApplicationQueriesSchemes</key>
     <array>
     <!-- 微信 URL Scheme 白名单-->
     <string>weiboApp</string>
     </array>
     */
    
    if (@available(iOS 10.0, *)) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weiboApp://"]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weiboApp://"] options:@{@"title":@"hehe"} completionHandler:^(BOOL success) {
                // NSLog(@"%zd",success);
            }];
        }
    } else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weiboApp://"]]){
        // Fallback on earlier versions
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weiboApp://"]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
