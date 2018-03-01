//
//  ViewController.m
//  apache配置
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
    /*
     
    /etc/apache2/httpd.conf
     修改 httpd.conf 配置文件
     修改路径
    DocumentRoot "/Users/huig/myWeb"
    <Directory "/Users/huig/myWeb">
    找到   Options FollowSymLinks Multiviews 在中间插入Indexes
     Options Indexes FollowSymLinks Multiviews
     去掉 #LoadModule php5_module libexec/apache2/libphp5.so
     前面的#号
    */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
