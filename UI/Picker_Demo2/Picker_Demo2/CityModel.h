//
//  CityModel.h
//  Picker_Demo2
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject
@property(nonatomic,strong)NSArray *cities;
@property(nonatomic,copy)NSString *name;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cityModelWithDict:(NSDictionary *)dict;
@end
