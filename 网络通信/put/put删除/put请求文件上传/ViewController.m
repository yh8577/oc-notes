//
//  ViewController.m
//  put请求文件上传
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self deleteFile];
}

- (void)deleteFile {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/123.jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"delete";

    [request setValue:[self getAuth:@"admin" pwd:@"ok156596"] forHTTPHeaderField:@"Authorization"];

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"--%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
    }]resume];
    
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
