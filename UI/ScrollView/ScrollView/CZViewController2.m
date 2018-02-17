//
//  CZViewController2.m
//  ScrollView
//
//  Created by jyh on 2018/2/2.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZViewController2.h"

@interface CZViewController2 ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property (weak, nonatomic) IBOutlet UIPageControl *pageC;
@property (strong, nonatomic) UIImageView *imgV;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation CZViewController2


/*
 NSTimer; (时间间隔比较大,1秒或几秒)
 CADisplayLink; (时间间隔比较小,0.0几秒)
 
 NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
 
 [timer fire];
 [timer fire];
 [timer fire];
 [timer fire];
 
*/


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

// 即将结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"即将结束拖拽");
    
}


// 每次拖拽的时候修改 page 的页码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int index =  (int)((scrollView.contentOffset.x + scrollView.frame.size.width *0.5) / scrollView.frame.size.width);

    self.pageC.currentPage = index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollV.delegate = self;


    // 注意点:如果 scrollView 是第一个添加到 view 上的控件那么 nav 偏移64 会影响 scrollView 中的控件也集体向下偏移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    CGFloat w = self.scrollV.frame.size.width;
    CGFloat h = self.scrollV.frame.size.height;

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
    
    CGFloat offSetX = page * self.scrollV.frame.size.width;
    
    [self.scrollV setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    
}



@end
