//
//  QDView.m
//  绘制图片
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

@implementation QDView


- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:@"3"];
    
    // 从那个点开始绘制
//    [image drawAtPoint:CGPointZero];
    
    // 在那个区域绘制
    // 这个是填充
    [image drawInRect:rect];

    // 平铺
//    [image drawAsPatternInRect:rect];
   
    
}


@end
