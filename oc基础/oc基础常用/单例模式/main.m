//
//  main.m
//  单例模式
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         
         创建单例
         
         + (instancetype)allocWithZone:(struct _NSZone *)zone {
         
         // 创建一个静态变量
         static id instance = nil;
         if (!instance) {
         instance = [super allocWithZone:zone];
         }
         
         return instance;
         }
         //单例模式规范
         必须创建单例类方法
         有两种格式
         + (instancetype)sharedPerson;
         + (instancetype)sharedPerson {
         return [self new];
         }
         
         + (instancetype)defaultPerson;
         + (instancetype)defaultPerson {
         return [self new];
         }
         
         // 存储在单例对象中的数据可以被共享.
         
         */
        Person *p1 = [Person new];
        Person *p2 = [Person new];
        Person *p3 = [Person new];
        Person *p4 = [Person new];
        
        Person *ps = [Person sharedPerson];
        
        
        
    }
    return 0;
}
