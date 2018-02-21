//
//  YHProductModel.h
//  网易彩票
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHProductModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *stitle;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *customUrl;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
