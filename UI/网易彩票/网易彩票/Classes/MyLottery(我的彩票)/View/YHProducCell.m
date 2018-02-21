//
//  YHProducCell.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHProducCell.h"
#import "YHProductModel.h"
@interface YHProducCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation YHProducCell

- (void)setProduct:(YHProductModel *)product {
    
    _product = product;
    
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.titleLabel.text = product.title;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
}

@end
