//
//  CZGroupedModel.h
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroupedModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)groupedWithDict:(NSDictionary *)dict;
@end
