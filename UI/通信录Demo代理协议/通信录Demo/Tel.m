//
//  Tel.m
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Tel.h"

@implementation Tel

// 归档
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


