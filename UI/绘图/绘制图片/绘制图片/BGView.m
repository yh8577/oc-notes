//
//  BGView.m
//  绘制图片
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "BGView.h"

@implementation BGView


- (void)drawRect:(CGRect)rect {
 
    [[UIImage imageNamed:@"1"] drawAsPatternInRect:rect];
    
}


@end
