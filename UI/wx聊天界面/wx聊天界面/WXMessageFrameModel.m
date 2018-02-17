//
//  WXMessageFrameModel.m
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXMessageFrameModel.h"
#import "WXMessageModel.h"
#import "NSString+QQNSStringExt.h"
#import <UIKit/UIKit.h>
@implementation WXMessageFrameModel

- (void)setMessageModel:(WXMessageModel *)messageModel {
    
    _messageModel = messageModel;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 5;
    
    CGFloat timeW = screenW;
    CGFloat timeH = 15;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    if (!messageModel.hideTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    CGFloat iconW = 30;
    CGFloat iconH = iconW;
    CGFloat iconY = CGRectGetMaxY(_timeFrame);
    CGFloat iconX = messageModel.type == messageTypeOther ? margin : screenW - margin - iconW;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGSize textSize = [messageModel.text sizeOfTextWithMaxSize:CGSizeMake(250, MAXFLOAT) font:textFont];

    CGFloat textW = textSize.width + 40;
    CGFloat textH = textSize.height + 30;
    CGFloat textX = messageModel.type == messageTypeOther ? CGRectGetMaxX(_iconFrame) : screenW - textW - iconW - margin;
    CGFloat textY = iconY;
    
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat maxY = MAX(CGRectGetMaxY(_iconFrame), CGRectGetMaxY(_textFrame));
    
    NSLog(@"%f",maxY);
    
    _rowHeight = maxY + margin;
}

@end
