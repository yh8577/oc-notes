//
//  main.m
//  NSDictionary
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#define NNLog(aa,val) NSLog(@aa,val);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"jack", @"name",@"18",@"age",@"188",@"weight", nil];
//        NNLog(dict)
//        NNLog(dict[@"name"])
//
//        NSDictionary *dict1 = @{@"name":@"huig",@"age":@"18"};
//        NNLog(dict1)
//        NNLog(dict1[@"age"])
        
//        NSString *str =[dict1 objectForKey:@"name"];
//        NNLog(%@,str)
        
//       NNLog("%lu", dict.count)
        // 拿到 key
//        NSArray *arr = dict.allKeys;
//        NNLog("%@", arr)
    
        //拿到值
//        NSArray *arr = dict.allValues;
//        NNLog("%@", arr)
        
        // 遍历字典
//        for (id str in dict) {
//            NSLog(@"%@ = %@", str , dict[str]);
//        }
        
        // block 遍历字典
//        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//
//            NSLog(@"%@ = %@",key, obj);
//            if ([obj isEqualToString:@"18"]) {
//                *stop = YES;
//            }
//        }];
        
//        Person *p5 = [[Person alloc] initWithName:@"小米5"];
//        Person *p1 = [[Person alloc] initWithName:@"小米1"];
//        Person *p2 = [[Person alloc] initWithName:@"小米2"];
//        Person *p3 = [[Person alloc] initWithName:@"小米3"];
//        Person *p4 = [[Person alloc] initWithName:@"小米4"];
//
//        NSDictionary *arr = @{
//                              p5.name : p5,
//                              p4.name : p1,
//                              p3.name : p2,
//                              p2.name : p3,
//                              p1.name : p4
//                              };
//
//        NSLog(@"%@",arr);
//
//        NSLog(@"%@",arr[@"小米3"]);
        
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"18",@"age",@"188",@"weight", nil];
        
        // 新增
        [dict setObject:@"构造" forKey:@"ds"];
        
        // key 重复,会覆盖原有的.
        [dict setObject:@"guangzhou" forKey:@"ds"];
        
        //NSLog(@"%@",dict);
        
        
        // 删除所有
//        [dict removeAllObjects];
        // 删除指定 key
//        [dict removeObjectForKey:@"ds"];

        // 保存到 plist
        [dict writeToFile:@"/Users/huig/Desktop/dict.plist" atomically:NO];
        
        // 读取 plist
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Users/huig/Desktop/dict.plist" ];
        
        NSLog(@"%@",dict1);
        
        
    }
    return 0;
}
