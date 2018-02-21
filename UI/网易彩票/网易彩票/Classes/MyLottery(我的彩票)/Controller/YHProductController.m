//
//  YHProductController.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHProductController.h"
#import "YHProductModel.h"
#import "YHProducCell.h"
@interface YHProductController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *prodicts;
@end

@implementation YHProductController

- (NSArray *)prodicts {
    if (!_prodicts) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"];
        
        // 把文件转成 data
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 通过 data 转 NSArray
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict  in tempArray) {
            YHProductModel *model = [YHProductModel productWithDict:dict];
            [arrM addObject:model];
        }
        _prodicts = arrM ;
    }
    return _prodicts;
}
- (instancetype)init {
    
    // 注意点: 一定时是 UICollectionViewFlowLayout ,不要选到 UICollectionViewLayout
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(16, 0, 0, 0 );
    
    return [super initWithCollectionViewLayout:layout];
}


static NSString * const reuseIdentifier = @"produc_Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"YHProducCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YHProductModel *model = self.prodicts[indexPath.row];
    
    NSLog(@"%@",model.title);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.prodicts.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    YHProducCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];

    YHProductModel *product = self.prodicts[indexPath.row];
    
    cell.product = product;

    return cell;
}


@end
