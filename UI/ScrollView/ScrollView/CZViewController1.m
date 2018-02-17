//
//  CZViewController1.m
//  ScrollView
//
//  Created by jyh on 2018/2/2.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZViewController1.h"

@interface CZViewController1 ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation CZViewController1

// 缩放方法
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // 返回要缩放的子控件;
    return self.imgV;
}


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    
    NSLog(@"即将开始缩放+++++++++++++++++");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"开始缩放~~~~~~~~~~~");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"结束缩放--------");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 注意点:如果 scrollView 是第一个添加到 view 上的控件那么 nav 偏移64 会影响 scrollView 中的控件也集体向下偏移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = NO;
    // 缩放比例
    self.scrollV.maximumZoomScale = 3.5;
    self.scrollV.minimumZoomScale = 0.5;
    
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

@end
