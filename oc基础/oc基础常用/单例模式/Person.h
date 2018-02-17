//
//  Person.h
//  单例模式
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (instancetype)sharedPerson;
+ (instancetype)defaultPerson;


@end
