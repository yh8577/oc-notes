 //
//  YHImageLoopController.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHImageLoopController.h"
#import "YHHeadline.h"
#import "YHHeadlineCell.h"

@interface YHImageLoopController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *headlines;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation YHImageLoopController

static NSString * const reuseIdentifier = @"headline";

    // 重写headlines刷新数据
- (void)setHeadlines:(NSArray *)headlines {
    _headlines = headlines;
    [self.collectionView reloadData];
    
    // 始终显示第二个 cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setCollectionViewStyle];
    
    [YHHeadline headlinesWithSuccess:^(NSArray *headlines) {
        self.headlines = headlines;
    } error:^{
        NSLog(@"数据源出错");
    }];

}

- (void)setCollectionViewStyle {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置FlowLayout
    self.flowLayout.itemSize = self.collectionView.frame.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 等待collectionView大小设置好后在设置 cell 的大小
    self.flowLayout.itemSize = self.collectionView.frame.size;
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.headlines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YHHeadlineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 计算无限轮播索引
    NSInteger index = (self.currentIndex + indexPath.item - 1 + self.headlines.count) % self.headlines.count;
    cell.tag = index;
    cell.headline = self.headlines[index];
    NSLog(@"indexPath = %zd",indexPath.item);
    NSLog(@"index = %zd",index);
    return cell;
}

#pragma mark <UICollectionViewDelegate>

// 滚动停止后换 cell
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    
    self.currentIndex = (self.currentIndex + offset + self.headlines.count) % self.headlines.count;
   
    dispatch_async(dispatch_get_main_queue(), ^{
        // 始终显示第二个 cell
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
    });

}



@end
