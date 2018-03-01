//
//  ViewController.m
//  plist解析
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/imagedata.plist"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        NSArray *arr =  [NSPropertyListSerialization propertyListWithData:data options:0 format:0 error:nil];
        
        NSLog(@"arr = %@",arr);
        
    }] resume];
}


@end
