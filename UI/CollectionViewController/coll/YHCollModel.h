//
//  YHCollModel.h
//  coll
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCollModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)collModelWith:(NSDictionary *)dict;
@end
