//
//  ViewController.m
//  重写 description
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"张三",@"李四",@"王五"];
    NSLog(@"%@",arr);
    
    NSDictionary *dict = @{@"name":@"张三"};
    NSLog(@"%@",dict);
    
    Person *p = [[Person alloc] init];
    
    p.name = @"张三";
    p.age = 10;
    
    NSLog(@"%@",p.description);
    
    
}


@end
