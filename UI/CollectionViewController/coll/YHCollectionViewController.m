//
//  YHCollectionViewController.m
//  coll
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHCollectionViewController.h"
#import "YHCollectionViewCell.h"
#import "YHCollModel.h"
@interface YHCollectionViewController ()
@property(nonatomic,strong)NSArray *model;
@end

@implementation YHCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    // 注意点 UICollectionViewFlowLayout 必须在加载之前就创建.在跳转的时候创建,或者在本类重写 init 方法中创建UICollectionViewFlowLayout
    // 这里很重要 UICollectionViewFlowLayout 一定不要写错成 UICollectionViewLayout.会导致不执行数据源方法.而且没有错误提示.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(50, 50);
    
    // 列最小间距,不是按照给定的值.注意点: 如果给定的值超过的最小的值会自动换行.
    layout.minimumInteritemSpacing = 30;
    // 行间距
    layout.minimumLineSpacing  = 50;
    // 组之间距离
    layout.sectionInset = UIEdgeInsetsMake(50, 20, 50, 20);
    // 滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}
- (NSArray *)model {
    if (!_model) {
        NSArray *arr = @[
                         @{@"icon":@"m_2_100",@"title":@"BMW"},
                         @{@"icon":@"m_3_100",@"title":@"FAT"},
                         @{@"icon":@"m_2_100",@"title":@"BMW"},
                         @{@"icon":@"m_3_100",@"title":@"FAT"},
                         @{@"icon":@"m_2_100",@"title":@"BMW"},
                         @{@"icon":@"m_3_100",@"title":@"FAT"},
                         @{@"icon":@"m_2_100",@"title":@"BMW"},
                         @{@"icon":@"m_3_100",@"title":@"FAT"}];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            YHCollModel *model = [YHCollModel collModelWith:dict];
            [arrM addObject:model];
            
        }
        _model = arrM;
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册 xib
//    UINib *nib = [UINib nibWithNibName:@"YHCollectionViewCell" bundle:nil];
//    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    // 注册系统自带的 , 如果是注册纯代码自定义的只要把 UICollectionViewCell 替换的你自定义的类
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    // 分页效果
    self.collectionView.pagingEnabled = YES;
    // 关闭滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 关闭弹性效果
    self.collectionView.bounces = NO;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.model.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 注册自定义的
//    YHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 注册系统自带的 , 如果是注册纯代码自定义的只要把 UICollectionViewCell 替换的你自定义的类
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    cell.backgroundColor = [UIColor redColor];
    
//    YHCollModel *model = self.model[indexPath.row];
//
//    cell.model = model;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
