//
//  ViewController.m
//  GET和POST
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self get];
}

- (void)post {
    NSString *name = @"123";
    NSString *pass = @"3211";

    name = [name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/login.php"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString *body = [NSString stringWithFormat:@"fname=%@&pass=%@",name,pass];
    
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            NSLog(@"%zd",httpResponse.statusCode);
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dict[@"data"]);
        NSNumber *isLogin = dict[@"data"][@"userId"];
        if (isLogin.intValue > 0) {
            NSLog(@"登录成功");
        } else {
            NSLog(@"登录失败");
        }
        
    }] resume];
}


- (void)get {
    
    NSString *name = @"张三";
    NSString *pass = @"18";
    NSString *urlstr = [NSString stringWithFormat:@"http://127.0.0.1/login.php?fname=%@&pass=%@",name,pass];
    urlstr = [urlstr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSURL *url = [NSURL URLWithString:urlstr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            NSLog(@"%zd",httpResponse.statusCode);
            return;
        }

        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dict);
        NSLog(@"%@",dict[@"data"]);
        NSNumber *isLogin = dict[@"data"][@"userId"];
        if (isLogin.intValue > 0) {
            NSLog(@"登录成功");
        } else {
            NSLog(@"登录失败");
        }
        
    }] resume];
}


@end
