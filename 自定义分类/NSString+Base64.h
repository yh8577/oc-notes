//
//  NSString+Base64.h
//  base64
//
//  Created by jyh on 2018/2/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
//加密
- (instancetype)base64Endcode;
//解码
- (instancetype)base64Decode;
@end
