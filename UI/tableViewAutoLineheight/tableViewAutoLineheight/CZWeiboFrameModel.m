//
//  CZWeiboFrameModel.m
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZWeiboFrameModel.h"
#import "CZWeiboModel.h"



@implementation CZWeiboFrameModel

- (void)setWeibo:(CZWeiboModel *)weibo {
    
    _weibo = weibo;
    
    CGFloat margin = 10;
    
    CGFloat iconW = 50;
    CGFloat iconH = iconW;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX = iconW + iconX + margin;
    
    NSString *nameStr = weibo.name;
    
    CGSize nameSize = [self sizeWithText:nameStr andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:textFont];
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = iconY + (iconH - nameH) * 0.5;
    
    _nameFrame = CGRectMake( nameX, nameY, nameW, nameH);
    
    CGFloat textX = iconX;
    CGFloat textY = iconY + iconH + margin;
    
    NSString *textStr = weibo.comments;
    CGSize textSize = [self sizeWithText:textStr andMaxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - margin , MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    
    CGFloat picW = 90;
    CGFloat picH = 90;
    CGFloat picX = iconX;
    CGFloat picY = textY + textH + margin;
    
    _picFrame = CGRectMake(picX, picY, picW, picH);
    
    
    
    if (weibo.pic) {
        _rowHeight = CGRectGetMaxY(_picFrame) + margin;
    } else {
        _rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    

    
}

- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)size andFont:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes: attr context:nil].size;
}


@end
