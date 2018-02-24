//
//  Download.h
//  多线程图片下载
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Download : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)downloadWithDict:(NSDictionary *)dict;

+ (NSArray *)download;
@end
