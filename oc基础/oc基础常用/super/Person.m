//
//  Person.m
//  lx
//
//  Created by jyh on 2018/1/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)seyHi {
    
    _name = @"jack";
    NSLog(@"Person SeyHi %@", _name);
}

- (void)setName:(NSString *)name {
    _name = name;
}


- (NSString *)name {
    
    return _name;
}
@end
