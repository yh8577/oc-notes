//
//  ViewController.m
//  GCD-异步下载图片
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)loadView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.scrollView;
    
    self.imageView = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.imageView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 开启你一个异步执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://img.zcool.cn/community/012a345944bc96a8012193a37c06d5.jpg@3000w_1l_2o_100sh.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        // 返回主线程,刷新 UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [self.imageView sizeToFit];
            self.scrollView.contentSize = image.size;
        });
    });
    
}




@end
