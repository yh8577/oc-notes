//
//  ViewController.m
//  发送异步请求
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    self.view = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://bbs.iosre.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *web = (UIWebView*)self.view;
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//
//        NSString *data1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//
//        NSLog(@"response = %@ , data = %@, connectionError = %@",response, data1, connectionError);
//    }];
    
    [web loadRequest:request];
    
}


@end
