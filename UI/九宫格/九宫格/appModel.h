//
//  appModel.h
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *img;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
