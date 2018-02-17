//
//  CZTuanGou.h
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZTuanGou : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tuangouWithDitc:(NSDictionary *)dict;
@end
