//
//  ViewController.m
//  json保存到文件中
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


    NSDictionary *dict = @{@"name":@"张三",@"age":@(19)};
    // 序列化 json 格式
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    // 保存json 格式对的文件
    [data writeToFile:@"/Users/huig/Desktop/json.json" atomically:NO];
    

    
    NSData *data1 = [NSData dataWithContentsOfFile:@"/Users/huig/Desktop/json.json"];
    // 读取 json 文件
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:nil];
    
    NSLog(@"%@",json);
}


@end
