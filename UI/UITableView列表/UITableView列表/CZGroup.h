//
//  CZGroup.h
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CZGroup : NSObject
@property(nonatomic,strong)NSArray *friends;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int online;

@property(nonatomic,assign,getter=isVisible)BOOL visible;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
