//
//  NSArray+Ex.m
//  重写 description
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NSArray+Ex.h"

@implementation NSArray (Ex)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"\r\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@,\r\n",obj];
    }];
    [strM appendString:@")"];
    return strM.copy;
}
@end

@implementation NSDictionary (Ex)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"\r\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@,\r\n",obj];
    }];
    [strM appendString:@")"];
    return strM.copy;
}
@end

