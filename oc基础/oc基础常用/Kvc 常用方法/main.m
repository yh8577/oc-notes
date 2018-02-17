//
//  main.m
//  Kvc 常用方法
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        Dog *d = [Dog new];
//        p.name = @"zhaoshan";
//
//
//        d.name = @"zao";
//        p.dog = d;
//
//        NSLog(@"%@ -- %@",p.name,p.dog.name);
//
//
//        // 通过 kvc 给属性赋值
//        [p setValue:@"李四" forKeyPath:@"name"];
//        [p setValue:@19 forKeyPath:@"age"];
////        [p.dog setValue:@"sb" forKeyPath:@"pz"];
//        [p setValue:d forKeyPath:@"dog"];
//
//        NSLog(@"%@, %d, -- %@", p.name, p.age, p.dog.name);
        
//        NSDictionary *dict = @{@"name":@"huihui",@"age":@19,@"dog":@{@"name":@"加灰猫"}};
//
//        [p setValuesForKeysWithDictionary:dict];
//        NSDictionary *dogDict = (NSDictionary *)p.dog;
//        NSLog(@"%@, %d, %@",p.name,p.age, dogDict[@"name"]);
        
//        [p setValue:@"huihui" forKeyPath:@"name"];
//        [p setValue:@18 forKeyPath:@"age"];
//        [p setValue:d forKeyPath:@"dog"];
//        [p setValue:@"加灰猫" forKeyPath:@"dog.name"];
//
//        NSLog(@"%@,%d,%@",p.name,p.age,p.dog.name);
        
        p.name = @"zhangshan";
        p.age = 18;
        d.name = @"汉时期";
        p.dog = d;
//        NSString *pname = [p valueForKeyPath:@"name"];
//        NSString *dname = [d valueForKeyPath:@"name"];
//        NSLog(@"%@, %@",pname,dname);
        
        //
//        NSArray *arr = @[p,d];
//        NSArray *name = [arr valueForKeyPath:@"name"];
//        for (NSString *str in name) {
//            NSLog(@"%@",str);
//        }
        
        
        // 对象转字典
        NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name",@"age",@"dog"]];
        NSLog(@"%@",dict);
        
        NSLog(@"%@", [dict[@"dog"] name]);
        
    }
    return 0;
}
