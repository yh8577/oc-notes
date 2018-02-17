//
//  CZWeiboModel.h
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZWeiboModel : NSObject
@property(nonatomic,copy)NSString *comments;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pic;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)weiboModelWithDict:(NSDictionary *)dict;

@end
