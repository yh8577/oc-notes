//
//  ViewController.m
//  异步下载图片
//
//  Created by jyh on 2018/2/22.
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
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.view = self.scrollView;
    self.imageView = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.imageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     </plist>
     */
    // 异步执行
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    [thread start];
}

- (void)downloadImage {
    NSURL *url = [NSURL URLWithString:@"http://img.zcool.cn/community/012a345944bc96a8012193a37c06d5.jpg@3000w_1l_2o_100sh.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    // 返回主线程
    [self performSelectorOnMainThread:@selector(updataUI:) withObject:image waitUntilDone:YES];
}

- (void)updataUI:(UIImage *)image {
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = image.size;
}


@end
