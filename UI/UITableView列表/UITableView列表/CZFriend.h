//
//  CZFriend.h
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFriend : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign,getter=isVip)BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)friendWithdict:(NSDictionary *)dict;
@end
