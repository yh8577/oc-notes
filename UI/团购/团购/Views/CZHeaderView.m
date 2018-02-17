//
//  CZHeaderView.m
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZHeaderView.h"

@interface CZHeaderView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property (weak, nonatomic) IBOutlet UIPageControl *pageC;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)CGFloat scrollWidth;

@end
@implementation CZHeaderView

+ (instancetype)headerView {
    
    CZHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CZHeaderView" owner:nil options:nil] firstObject];
    
    return headerView;
}

- (void)awakeFromNib {

    [super awakeFromNib];
    
    self.scrollV.delegate = self;

    self.scrollWidth = self.scrollV.frame.size.width;
    CGFloat w = self.scrollWidth;
    CGFloat h = self.scrollV.frame.size.height;
    
    NSLog(@"%f",self.scrollV.frame.size.width );
    CGFloat y = 0;
    
    for (int i = 0 ; i < 5; i++) {
        
        self.imgV = [[UIImageView alloc] init];
        CGFloat x = i * w;
        self.imgV.frame = CGRectMake(x, y, w, h);
        self.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
        
        [self.scrollV addSubview:self.imgV];
        
        self.scrollV.contentSize = CGSizeMake(w*5, h);
        self.scrollV.pagingEnabled = YES;
        
    }
    
    self.pageC.numberOfPages = 5;
    self.pageC.currentPage = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];

}

- (void)test {
    
    NSInteger page = self.pageC.currentPage;
    
    if (page == self.pageC.numberOfPages - 1) {
        page = 0;
    } else
    {
        page ++;
    }
    
    CGFloat offSetX = page * self.scrollWidth;
    [self.scrollV setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    
}

#pragma mark -- UIScrollViewDelegate

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

@end
