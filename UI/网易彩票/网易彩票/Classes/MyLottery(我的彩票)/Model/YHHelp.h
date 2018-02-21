//
//  YHHelp.h
//  网易彩票
//
//  Created by jyh on 2018/2/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHHelp : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *html;
@property(nonatomic,copy)NSString *ID;

+ (instancetype)helpWithDict:(NSDictionary *)dict;

@end
