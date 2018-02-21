//
//  YHGroupBuyButton.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGroupBuyButton.h"
#import "UIView+Frame.h"
@implementation YHGroupBuyButton

- (void)layoutSubviews {
    [super layoutSubviews];

    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width;

}

@end
