//
//  YHImageView.m
//  模仿imageView
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHImageView.h"

@implementation YHImageView

- (instancetype)initWithImage:(UIImage *)image {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)]) {
        self.image = image;
    }
    
    return self;
}
- (void)setImage:(UIImage *)image {
    
    _image = image;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    [self.image drawInRect:rect];
    
    
    
}


@end
