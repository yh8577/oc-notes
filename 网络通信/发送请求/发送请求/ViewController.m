//
//  ViewController.m
//  发送请求
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
//#import <Foundation/NSURLRequest.h>
//#import <Foundation/NSURLSession.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test5];
}

- (void)test5 {
    
    // 方法3 推荐使用
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    
    [request setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1" forHTTPHeaderField:@"User-Agent"];
    

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        NSLog(@"%@",response);
//        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);



    }];


    //发送请求（执行Task）
    [dataTask resume];
    
    
   
}

- (void)test4 {
    // 方法2  过时方法
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    // 使用的默认缓存策略,超时时长60秒
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    /**
     // 缓存策略
     NSURLRequestUseProtocolCachePolicy = 0, // 使用 http 协议的缓存策略
     NSURLRequestReloadIgnoringLocalCacheData = 1, //忽略本地缓存 加载最新数据
     NSURLRequestReturnCacheDataElseLoad = 2, // 如果有缓存返回,否则重新加载
     NSURLRequestReturnCacheDataDontLoad = 3, // 返回缓存数据,没有缓存也不重新加载
     
     NSURLRequestReloadRevalidatingCacheData = 5, // Unimplemented // 未实现的
     NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4, // Unimplemented // 未实现的
     NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData, //忽略本地缓存 加载最新数据
     */
    // 默认缓存策略,超时时长15秒.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    /*
     User-Agent:Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1
     */
    [request setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1" forHTTPHeaderField:@"User-Agent"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);
    }];
}


- (void)test3 {
     // 方法3 推荐使用
// 简单写法
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",error);
        NSLog(@"%@",response);
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);

    }] resume];
}

- (void)test2 {
    // 方法3 推荐使用
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",error);
        NSLog(@"%@",response);
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);
        
    }];
    
    //发送请求（执行Task）
    [dataTask resume];
}


- (void)test1 {
    //     方法1 不推荐
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);
}




@end
