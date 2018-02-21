//
//  YHGuideController.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGuideController.h"
#import "YHGuideCell.h"
#import "UIView+Frame.h"
#import "YHTabBarController.h"
@interface YHGuideController ()
@property (nonatomic,weak)UIImageView *largeImageView;
@property (nonatomic,weak)UIImageView *largeTextImageView;
@property (nonatomic,weak)UIImageView *smallTwxtImageView;
@property (nonatomic,weak)UIButton *loginBtn;
@property(nonatomic,assign)int page;
@end

@implementation YHGuideController

static NSString * const reuseIdentifier = @"guide_cell";

- (instancetype)init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 大小
    layout.itemSize = kScreenSize.size;
    // 间距
    layout.minimumLineSpacing = 0;
    // 滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[YHGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 分页效果
    self.collectionView.pagingEnabled = YES;
    // 关闭滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 关闭弹性效果
    self.collectionView.bounces = NO;
    UIImageView *largeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.largeImageView = largeImageView;
    UIImageView *largeTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.largeTextImageView = largeTextImageView;
    largeTextImageView.y = self.collectionView.height * 0.75;
    UIImageView *smallTwxtImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.smallTwxtImageView = smallTwxtImageView;
    smallTwxtImageView.y = self.collectionView.bounds.size.height * 0.85;
    [self.collectionView addSubview:largeImageView];
    [self.collectionView addSubview:largeTextImageView];
    [self.collectionView addSubview:smallTwxtImageView];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setImage:[UIImage imageNamed:@"guideStart"] forState:(UIControlStateNormal)];
    [loginBtn sizeToFit];
    loginBtn.alpha = 0;
    loginBtn.y = self.collectionView.height;
    self.loginBtn = loginBtn;
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.collectionView addSubview:loginBtn];
  
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    lineImageView.x = -220;
    [self.collectionView addSubview: lineImageView];

}

- (void)loginBtnClick {
    
    YHTabBarController *tabBar = [[YHTabBarController alloc] init];
    // 方法1:
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    window.rootViewController = tabBar;
    // 方法2
    self.view.window.rootViewController = tabBar;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    int page = offsetX / kScreenWidth;
    
    NSString *largeImageName = [NSString stringWithFormat:@"guide%d",page + 1];
    NSString *largeTextImageName = [NSString stringWithFormat:@"guideLargeText%d",page + 1];
    NSString *smallTwxtImageName = [NSString stringWithFormat:@"guideSmallText%d",page + 1];
    
    self.largeImageView.image = [UIImage imageNamed:largeImageName];
    self.largeTextImageView.image = [UIImage imageNamed:largeTextImageName];
    self.smallTwxtImageView.image = [UIImage imageNamed:smallTwxtImageName];

    if (self.page > page) {
        self.largeImageView.x = offsetX - kScreenWidth;
        self.largeTextImageView.x = offsetX - kScreenWidth;
        self.smallTwxtImageView.x = offsetX - kScreenWidth;
    }else {
        self.largeImageView.x = offsetX + kScreenWidth;
        self.largeTextImageView.x = offsetX + kScreenWidth;
        self.smallTwxtImageView.x = offsetX + kScreenWidth;
    }
    if (page == 3) {
        self.loginBtn.centerX = self.collectionView.centerX + offsetX;
        self.loginBtn.y = self.collectionView.height * 0.65;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.largeImageView.x = offsetX;
        self.largeTextImageView.x = offsetX;
        self.smallTwxtImageView.x = offsetX;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            if (page == 3) {
                self.loginBtn.alpha = 1;
            } else {
                self.loginBtn.alpha = 0;
            }
        }];
    }];

    self.page = page;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YHGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.row + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    cell.image = image;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}




@end
