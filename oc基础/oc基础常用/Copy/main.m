//
//  main.m
//  Copy
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         之定义类实现copy拷贝方法必须遵守 NSCopying 协议,实现- (id)copyWithZone:(NSZone *)zone.
        
         // 集体实现
         - (id)copyWithZone:(NSZone *)zone {
         // 如果是深拷贝,就要重新创建一个对象
         // 把对象的属性的值,复制到新的对象中 然后返回新的对象
         Person *p = [Person new];
         p.name = _name;
         
         return p;
         // 如果是潜拷贝直接放回 self
         //    return self;
         }
         
         */
        
        
        
        Person *p = [Person new];
        p.name = @"jack";
        Person *p1 = [p copy];
        NSLog(@"%@",p1.name);
        
        
        
        // 注意点:如果是 NSString 类型 不管是 mrc 或 arc 一律使用 copy
//        Person *p = [Person new];
//
//        NSMutableString *sM = [NSMutableString stringWithFormat:@"jcak1"];
//
//        p.name = sM;
//        // 赋值以后修改 sM 的值会改变 p.name 的值
//        // 所以解决方法是利用 copy 方法避免.赋值以后出现对象的属性值发生变化.
//        [sM appendString:@"rose"];
//
//        NSLog(@"%@",p.name);
//
//
////        NSString *s = @"jack";
//        NSString *s = [NSString stringWithFormat:@"jack"];
//
//        p.name = s;
//        // 赋值以后修改 s 的值不会改变 p.name 的值
//        s = @"rose";
//        NSLog(@"name = %@",p.name);
        
        
        // 对存储在堆区,mrc 模式下引用计数器默认是1
        //        NSString *str = [NSString stringWithFormat:@"jack"];
        
        // 存储在常量区,mrc 引用计数器是无限大.因为不应许被释放
        // NSString *str = @"jack";
        //        NSLog(@"%lu",str.retainCount);
        
        // NSObject 两个对象方法 copy 和 mutableCopy
        // copy 对 NSString 的拷贝,是浅拷贝.只是指针地址的拷贝.潜拷贝会对引用计数器加 1
        // copy 对 NSMutableString 是深拷贝,会创建一个新对象. 深拷贝对原来的对象引用计数器不会加 1 . 新对象引用计数器也是 1
        // mutableCopy 对 NSString 和 NSMutableString 都是深拷贝,都会创建一个新的对象.
        // 这是 copy 和 NSMutableString ,对字符串的特点.
        //        NSString *str1 = @"jack";
        //
        //        NSMutableString *str2 = [str1 mutableCopy];
        //        [str2 appendString:@"aaaaa"];
        //        NSLog(@"%@",str1);
        //        NSLog(@"%@",str2);
        
        
        
    }
    return 0;
}
