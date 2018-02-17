
//
//  Person.m
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc  {
    
    NSLog(@"person 销毁 ");
}

- (instancetype)initWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender{
    
    if (self = [super init]) {
        _name = name;
        _age = age;
        _height = height;
        _gender = gender;
    }
    
    return self;
}

+ (instancetype)person {
    
    return [[self alloc] init];
}

+  (instancetype)personWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender {

    return [[self alloc] initWithName:name andAge:age andHeight:height andGender:gender];
}



@end
