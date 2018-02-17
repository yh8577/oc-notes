//
//  QQMessageFrame.m
//  QQ聊天界面
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QQMessageFrame.h"
#import <UIKit/UIKit.h>
#import "QQMessage.h"
#import "NSString+QQNSStringExt.h"



@implementation QQMessageFrame

- (void)setMessage:(QQMessage *)message {
    
    _message = message;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 5;

    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screenW;
    CGFloat timeH = 15;
    if (!message.hideTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    

    CGFloat iconW = 30;
    CGFloat iconH = iconW;
    CGFloat iconY = CGRectGetMaxY(_timeFrame);
    CGFloat iconX = message.type == QQMessageTypeOther ? margin : screenW - margin - iconW;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    CGSize textSize = [message.text sizeOfTextWithMaxSize:CGSizeMake(250, MAXFLOAT) font:textFont];
    CGFloat textW = textSize.width + 40;
    CGFloat textH = textSize.height + 30;
    CGFloat textY = iconY;
    CGFloat textX = message.type == QQMessageTypeOther ? CGRectGetMaxX(_iconFrame) : (screenW - textW - iconW - margin);
    _textFrame = CGRectMake(textX, textY, textW, textH);

    CGFloat maxY =  MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame));

    
    _rowHeight = maxY + margin;
}

@end
