//
//  ViewController.m
//  Session-DownloadTask
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
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downloadTask];
}

- (void)downloadTask {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/aa.dmg"];
    
    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
       NSString *pathStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES).lastObject;
        
        NSString *path = [pathStr stringByAppendingPathComponent:[url lastPathComponent]];
        [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:path error:NULL];
        
        NSLog(@"%@",path);
        // 注意点:这里是子线程
    }] resume];
    
    
    
    
}


@end
