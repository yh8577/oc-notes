//
//  NSString+QQNSStringExt.m
//  QQ聊天界面
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NSString+QQNSStringExt.h"

@implementation NSString (QQNSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes: attr context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font {
    
    return [text sizeOfTextWithMaxSize:maxSize font:font];
}

@end
