//
//  CZViewController3.m
//  ScrollView
//
//  Created by jyh on 2018/2/2.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZViewController3.h"

@interface CZViewController3 ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageC;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV1;
@property (strong, nonatomic) UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV2;
@property (weak, nonatomic) IBOutlet UIImageView *image8;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation CZViewController3

// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"开始拖拽");
    
    // 停止计时器,一旦停止.就必须重新创建一个新的计时器.
    [self.timer invalidate];
    // 因为计时器已经毁掉所以,把指针指向 nil;
    self.timer = nil;
}

// 结束拖拽
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSLog(@"结束拖拽");
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 每次拖拽的时候修改 page 的页码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index =  (int)((scrollView.contentOffset.x + scrollView.frame.size.width *0.5) / scrollView.frame.size.width);
    
    self.pageC.currentPage = index;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.scrollV2.delegate = self;
    
    CGFloat w = self.scrollV2.frame.size.width;
    CGFloat h = self.scrollV2.frame.size.height;
    
    CGFloat y = 0;
    
    for (int i = 0 ; i < 5; i++) {
        self.imgV = [[UIImageView alloc] init];
        CGFloat x = i * w;
        self.imgV.frame = CGRectMake(x, y, w, h);
        self.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
        self.imgV.contentMode = UIViewContentModeScaleToFill;
        [self.scrollV2 addSubview:self.imgV];
        
        self.scrollV2.contentSize = CGSizeMake(w*5, h);
        self.scrollV2.pagingEnabled = YES;
    }
    
    self.pageC.numberOfPages = 5;
    self.pageC.currentPage = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    
    CGFloat maxY = CGRectGetMaxY(self.image8.frame);
    CGSize size = self.scrollV1.contentSize;
    size.height = maxY;
    self.scrollV1.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    self.scrollV1.contentSize = size;
}

- (void)test {
    
    NSInteger page = self.pageC.currentPage;
    
    if (page == self.pageC.numberOfPages - 1) {
        page = 0;
    } else
    {
        page ++;
    }
    
    CGFloat offSetX = page * self.scrollV2.frame.size.width;
    
    [self.scrollV2 setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    
}


@end
