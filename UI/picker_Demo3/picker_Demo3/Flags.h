//
//  Flags.h
//  picker_Demo3
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flags : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)flagsWithDict:(NSDictionary *)dict;
@end
