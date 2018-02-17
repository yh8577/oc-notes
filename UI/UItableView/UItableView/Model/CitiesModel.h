//
//  CitiesModel.h
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitiesModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)citiesModelDict:(NSDictionary *)dict;


@end
