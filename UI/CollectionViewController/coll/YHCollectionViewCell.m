//
//  YHCollectionViewCell.m
//  coll
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHCollectionViewCell.h"
#import "YHCollModel.h"
@interface YHCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation YHCollectionViewCell

- (void)setModel:(YHCollModel *)model {
    
    _model = model;
    
    self.imageV.image = [UIImage imageNamed:model.icon];
    self.lbl.text = model.title;
}


@end
