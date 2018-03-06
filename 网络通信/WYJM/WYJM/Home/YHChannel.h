//
//  YHChannel.h
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHChannel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy, readonly) NSString *urlString;

+ (instancetype)channelWithDic:(NSDictionary *)dic;
+ (NSArray *)channels;
@end
