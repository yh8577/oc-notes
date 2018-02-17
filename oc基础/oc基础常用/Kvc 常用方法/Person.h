//
//  Person.h
//  Kvc 常用方法
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,strong)Dog *dog;
@end
