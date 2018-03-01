//
//  NSString+MD5.h
//  MD5加密
//
//  Created by jyh on 2018/2/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
- (NSString *)md5;
- (NSString *)md5:(NSString *)str;
@end
