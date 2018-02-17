//
//  Person.m
//  Copy
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)copyWithZone:(NSZone *)zone {
    // 如果是深拷贝,就要重新创建一个对象
    // 把对象的属性的值,复制到新的对象中 然后返回新的对象
    Person *p = [Person new];
    p.name = _name;
    
    return p;
    // 如果是潜拷贝直接放回 self
//    return self;
}

//- (void)setName:(NSString *)name {
//    
//    _name = [name copy];
//}
//
//- (NSString *)name {
//    
//    return _name;
//}
@end
