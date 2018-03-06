//
//  ViewController.m
//  Session-Datatask
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataTask3];
}

- (void)dataTask3 {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/login/newLogin.php"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    NSString *body = @"username=123&password=321";
    NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", json);
    }] resume];
}

// 默认get
- (void)dataTask2 {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data/data.json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", json);
        
    }] resume];
    
}

//  默认get
- (void)dataTask1 {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data/data.json"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        NSLog(@"%@", json);
        
    }];
    
    [dataTask resume];


}

@end
