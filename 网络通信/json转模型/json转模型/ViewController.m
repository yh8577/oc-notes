//
//  ViewController.m
//  json转模型
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/data.json"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSLog(@"%@",dict);
        Model *model = [Model modelWithDict:dict];
        NSLog(@"%@",model);
    }] resume];
    
    
}


@end
