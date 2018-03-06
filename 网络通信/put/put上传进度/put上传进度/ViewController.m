//
//  ViewController.m
//  put上传进度
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionTaskDelegate>

@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //NSURLSessionConfiguration 统一设置 session 信息
        configuration.HTTPAdditionalHeaders = @{@"Authorization":[self getAuth:@"admin" pwd:@"ok156596"]};

        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self uploadTask];
}

-(void)dealloc {
    
    NSLog(@"dealloc");
}

- (void)uploadTask {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/1.jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"put";
    //    Authorization    Basic YWRtaW46b2sxNTY1OTY=
    //    admin:ok156596
//    [request setValue:[self getAuth:@"admin" pwd:@"ok156596"] forHTTPHeaderField:@"Authorization"];
    
    NSURL *fullUrl = [[NSBundle mainBundle] URLForResource:@"8.jpg" withExtension:nil];
    
    [[self.session uploadTaskWithRequest:request fromFile:fullUrl] resume];

   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 注意点:上传完成必须释放session 否则会找出循环引用
    [self.session finishTasksAndInvalidate];

}


/**
 上传进度

 @param session NSURLSession
 @param task NSURLSessionTask
 @param bytesSent 发送字节
 @param totalBytesSent 发送的总字节数
 @param totalBytesExpectedToSend 预计发送的总字节数
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    float progress = 1.0 * totalBytesSent / totalBytesExpectedToSend;

    NSLog(@"上传进度: %f",progress);
}

- (void)URLSession:(NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    NSLog(@"上传完成: %@",task.response);
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSString *)getAuth:(NSString *)name pwd:(NSString *)pwd {
    NSString *tempStr = [NSString stringWithFormat:@"%@:%@",name,pwd];
    tempStr = [self base64Encode:tempStr];
    //    Basic YWRtaW46b2sxNTY1OTY=
    return [NSString stringWithFormat:@"Basic %@",tempStr];
}

- (NSString *)base64Encode:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
@end
