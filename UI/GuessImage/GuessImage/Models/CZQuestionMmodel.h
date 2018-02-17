//
//  CZQuestionMmodel.h
//  GuessImage
//
//  Created by jyh on 2018/2/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZQuestionMmodel : NSObject
@property(nonatomic,copy)NSString *answer;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)questionWithDict:(NSDictionary *)dict;
@end
