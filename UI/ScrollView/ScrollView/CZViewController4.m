//
//  CZViewController4.m
//  ScrollView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZViewController4.h"

@interface CZViewController4 ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property (weak, nonatomic) IBOutlet UIPageControl *pageC;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIButton *btn;

@end

@implementation CZViewController4



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offSetX = scrollView.contentOffset.x;
    
    offSetX += scrollView.frame.size.width * 0.5;
    
    NSInteger index = offSetX / scrollView.frame.size.width;
    
    self.pageC.currentPage = index;
    
    if (self.pageC.currentPage == 4) {

        self.btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.btn.frame = CGRectMake((self.imgV.frame.size.width - 200) / 2, 550, 200, 35);
        [self.btn setTitle:@"go ...." forState:(UIControlStateNormal)];
        self.btn.backgroundColor = [UIColor grayColor];
        self.btn.alpha = 0.5;
        [self.btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self.btn addTarget:self action:@selector(colseClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self.imgV addSubview:self.btn];
        self.imgV.userInteractionEnabled = YES;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = YES;
    
    CGSize scrollSize = self.scrollV.frame.size;
    
    CGFloat w = scrollSize.width;
    CGFloat h = scrollSize.height;
    
    CGFloat y = 0;
    
    for (int i = 0; i < 5; i++) {
        
        self.imgV = [[UIImageView alloc] init];
        CGFloat x = i * w;
        self.imgV.frame = CGRectMake(x, y, w, h);
        self.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i + 1]];

        [self.scrollV addSubview:self.imgV];
        
        self.scrollV.contentSize = CGSizeMake(w*5, h);
        self.scrollV.pagingEnabled = YES;
        

    }
    
    self.pageC.numberOfPages = 5;
    self.pageC.currentPage = 0;



}

- (void)colseClick {
    
    self.tabBarController.selectedIndex = 1;
}


@end
