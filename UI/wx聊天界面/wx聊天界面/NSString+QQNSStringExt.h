//
//  NSString+QQNSStringExt.h
//  QQ聊天界面
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (QQNSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;
@end
