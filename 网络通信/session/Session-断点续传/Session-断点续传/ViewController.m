//
//  ViewController.m
//  Session-断点续传
//
//  Created by jyh on 2018/3/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHProgressView.h"
#import "YHSessionDownload.h"
#import "math.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) YHProgressView *pView;
@property (nonatomic, assign) BOOL isPause;
@property (nonatomic, assign) BOOL isStart;
@property (nonatomic, assign) NSInteger tag;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.urls = @[@"http://127.0.0.1/image.zip",@"http://127.0.0.1/031-34987-A.dmg",@"http://127.0.0.1/image.zip"];
    [self downloadView:self.urls];
    
    
    
}

- (void)downloadView:(NSArray *)urls {
    
    for (int i = 0 ; i < urls.count; i++) {
        CGFloat pViewY = 100 * i;
        YHProgressView *pView = [YHProgressView buttonWithType:(UIButtonTypeCustom)];
        pView.frame = CGRectMake(20, pViewY + 20, 60, 60);
        [pView setTitle:@"开始"];
        pView.fontOfSize = 12;
        pView.tag = i;
        [pView addTarget:self action:@selector(pView:) forControlEvents:(UIControlEventTouchUpInside)];
        [pView addTarget:self action:@selector(pView:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:pView];
    }
}

- (void)pView:(YHProgressView *)sender {
    if (sender.tag != self.tag) {
        self.isStart = YES;
        self.isPause = NO;
    }
    if (self.isStart) {
        NSLog(@"开始");
        [self start:sender];
    } else if (self.isPause) {
        NSLog(@"暂停");
        [self pause];
    } else if(!self.isStart && !self.isPause) {
        NSLog(@"继续");
        [self resume];
    }
    self.tag = sender.tag;
}

- (void)start:(YHProgressView *)sender {
    
    self.isPause = YES;
    self.isStart = NO;
    [YHSessionDownload start:self.urls[sender.tag] successBlock:^(BOOL isSuccess) {
        self.isStart = YES;
    } progressBlock:^(float progress) {
        sender.progress = progress;
    } errorBlock:^(NSError *error) {
        
    }];
    
}

- (void)pause {
    self.isPause = NO;
    [YHSessionDownload pause];
}

- (void)resume {
    self.isPause = YES;
    [YHSessionDownload resume];
}


@end
