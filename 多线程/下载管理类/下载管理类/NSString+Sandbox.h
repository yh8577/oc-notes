//
//  NSString+Sandbox.h
//  多线程图片下载
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sandbox)
- (instancetype)appendCache;
- (instancetype)appendTemp;
- (instancetype)appendDocument;

@end
