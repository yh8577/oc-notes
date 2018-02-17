//
//  coding.m
//  持久化存储
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "coding.h"

@implementation coding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_tel forKey:@"tel"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
