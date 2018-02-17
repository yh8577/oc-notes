//
//  YHImageView.h
//  模仿imageView
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHImageView : UIView
@property(nonatomic,strong)UIImage *image;
- (instancetype)initWithImage:(UIImage *)image;
@end
