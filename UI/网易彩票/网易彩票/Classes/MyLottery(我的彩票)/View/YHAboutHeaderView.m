//
//  YHAboutHeaderView.m
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHAboutHeaderView.h"

@implementation YHAboutHeaderView

+ (instancetype)aboutHeaderView {
    return [[NSBundle mainBundle] loadNibNamed:@"YHAboutHeaderView" owner:nil options:nil][0];
    
}


@end
