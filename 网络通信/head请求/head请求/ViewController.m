//
//  ViewController.m
//  head请求
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/aa.dmg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    request.HTTPMethod = @"head";

    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            return;
        }
        
        NSLog(@"%@",data);
        NSLog(@"response = %@",response);
        NSLog(@"%zd",response.expectedContentLength);// 文件大小
        NSLog(@"nsme : %@",response.suggestedFilename); //文件名称 
        NSLog(@"加载数据");
        
    }] resume];
    
    
}


@end
