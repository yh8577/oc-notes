//
//  YHCollectionViewCell.h
//  coll
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHCollModel;
@interface YHCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)YHCollModel *model;
@end
