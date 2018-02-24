//
//  NSString+Sandbox.m
//  多线程图片下载
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NSString+Sandbox.h"

@implementation NSString (Sandbox)
- (instancetype)appendTemp {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)appendCache {
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)appendDocument {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}
@end
