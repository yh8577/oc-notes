//
//  ViewController.m
//  NSCache
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSCache *cache;
@end

@implementation ViewController

- (NSCache *)cache {
    
    if (!_cache) {
        _cache = [[NSCache alloc] init];
    }
    return _cache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
