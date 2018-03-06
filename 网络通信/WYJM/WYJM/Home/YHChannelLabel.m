//
//  YHChannelLabel.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//
#define kBIGFONT 18
#define KSMALLFONT 14
#import "YHChannelLabel.h"

@implementation YHChannelLabel

+ (instancetype)channelLabelWithTName:(NSString *)tneme {
    YHChannelLabel *lbl = [self new];
    lbl.text = tneme;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:kBIGFONT];
    [lbl sizeToFit];
    lbl.font = [UIFont systemFontOfSize:KSMALLFONT];
    return lbl;
}

// 按比例改变文字大小
- (void)setScale:(CGFloat)scale {
    CGFloat max = 1.0 * kBIGFONT / KSMALLFONT - 1;
    self.transform = CGAffineTransformMakeScale(max * scale + 1, max * scale + 1);
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}

@end
