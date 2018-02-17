//
//  Person.m
//  NSDictionary
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    
    if (self == [super init]) {
        _name = name;
    }
    return self;
}

@end
