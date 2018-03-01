//
//  Person.m
//  重写 description
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ { name: %@, age: %d }",[super description],self.name,self.age];
}

@end
