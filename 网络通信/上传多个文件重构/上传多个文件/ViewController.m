//
//  ViewController.m
//  上传多个文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHUploadFiles.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *urlStr = @"http://127.0.0.1/upload/upload-m1.php";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1.jpg" ofType:nil];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"2.jpg" ofType:nil];
    NSArray *fieldPaths =@[path,path1];
    
    NSArray *params = @[@{@"username[]":@"hi"},@{@"username[]":@"hi4"},@{@"username[]":@"hi2"}];

    [YHUploadFiles uploadFiles:urlStr fieldName:@"file[]" fieldPaths:fieldPaths params:params];
}


@end
