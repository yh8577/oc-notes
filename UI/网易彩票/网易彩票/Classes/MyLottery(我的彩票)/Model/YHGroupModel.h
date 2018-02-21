//
//  YHGroupModel.h
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHGroupModel : NSObject
@property(nonatomic,copy)NSString *footer;
@property(nonatomic,copy)NSString *header;
@property(nonatomic,strong)NSArray *items;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
