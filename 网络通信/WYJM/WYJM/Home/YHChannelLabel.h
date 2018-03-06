//
//  YHChannelLabel.h
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHChannelLabel : UILabel
+ (instancetype)channelLabelWithTName:(NSString *)tneme;
@property (nonatomic, assign) CGFloat scale;
@end
