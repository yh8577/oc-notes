//
//  ViewController.m
//  Session-https
//
//  Created by jyh on 2018/3/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionTaskDelegate>
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController

- (NSURLSession *)session {
    
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    }
    
    return _session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//   https://kyfw.12306.cn/otn/index/init
    NSURL *url = [NSURL URLWithString:@"https://kyfw.12306.cn/otn/"];
    
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
    }] resume];
    
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust ) {
        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        completionHandler(0,credential);
    }
}

@end
