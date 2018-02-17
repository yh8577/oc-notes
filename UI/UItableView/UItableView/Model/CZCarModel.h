//
//  CZCatModel.h
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZCarModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)catWithDict:(NSDictionary *)dict;

@end
