//
//  YHGuideCell.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGuideCell.h"

@interface YHGuideCell ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation YHGuideCell

- (UIImageView *)imageView {
    
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = kScreenSize;
        [self addSubview: imageView];
        
        _imageView = imageView;
    }
    return _imageView;
}


- (void)setImage:(UIImage *)image {
    
    _image = image;
    self.imageView.image = image;
    
}



@end
