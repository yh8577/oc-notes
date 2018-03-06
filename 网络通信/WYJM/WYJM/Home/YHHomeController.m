//
//  YHHomeController.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHomeController.h"
#import "YHChannel.h"
#import "YHChannelLabel.h"
#import "YHHomeCell.h"
@interface YHHomeController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *channels;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) int currentIndex;

@end

@implementation YHHomeController

- (NSArray *)channels {
    if (!_channels) {
        _channels = [YHChannel channels];
    }
    return _channels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadChannels];
    
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}


- (void)loadChannels {
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat marginX = 5;
    CGFloat x = marginX;
    CGFloat h = self.scrollView.bounds.size.height;
    
    for (YHChannel *channel in self.channels) {
        YHChannelLabel *lbl = [YHChannelLabel channelLabelWithTName:channel.tname];
        lbl.frame = CGRectMake(x, 0, lbl.bounds.size.width, h);
        x += lbl.bounds.size.width + marginX;
        [self.scrollView addSubview:lbl];
    }
    // 设置滚动范围
    self.scrollView.contentSize = CGSizeMake(x, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置第一个 label
    YHChannelLabel *lbl = self.scrollView.subviews[0];
    lbl.scale = 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channels.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YHHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"news" forIndexPath:indexPath];
    YHChannel *channel = self.channels[indexPath.item];
    cell.urlString = channel.urlString;
    return cell;
}

// 正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    YHChannelLabel *currentLabel = self.scrollView.subviews[self.currentIndex];
    
    YHChannelLabel *nextLabel = nil;
    
    for (NSIndexPath *indexPath in self.collectionView.indexPathsForVisibleItems) {
        if (indexPath.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[indexPath.item];
            break;
        }
    }
    if (nextLabel == nil) {
        return;
    }
    // 滚动比例 ABS 取绝对值
    CGFloat nextScale = ABS(scrollView.contentOffset.x / scrollView.bounds.size.width - self.currentIndex);
    CGFloat currentScale = 1 - nextScale;
    
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
}

// 滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    YHChannelLabel *lbl = self.scrollView.subviews[self.currentIndex];
    CGFloat offset = lbl.center.x - self.scrollView.bounds.size.width * 0.5;
    CGFloat maxOffset = self.scrollView.contentSize.width - lbl.bounds.size.width - self.scrollView.bounds.size.width;
    if (offset < 0) {
        offset = 0;
    } else if (offset > maxOffset) {
        offset = maxOffset + lbl.bounds.size.width;
    }
    
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}


@end
