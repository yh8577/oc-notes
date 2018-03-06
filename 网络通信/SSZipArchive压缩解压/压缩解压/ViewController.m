//
//  ViewController.m
//  压缩解压
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "SSZipArchive.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //压缩
    [SSZipArchive createZipFileAtPath:@"/Users/huig/Desktop/image.zip" withContentsOfDirectory:@"/Users/huig/Desktop/image"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/image.zip"];
    
    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        解压
        [SSZipArchive unzipFileAtPath:location.path toDestination:NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject uniqueId:@"123"];
        NSLog(@"%@",location);
        
    }]resume];
    
    
}





@end
