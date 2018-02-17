//
//  main.m
//  NSArray
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#define NNLog(val); NSLog(@"%@",val);
#define NJLog(val); NSLog(@"%@",val==YES?@"YES":@"NO");
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 注意点:只能存储oc 对象类型.其他类型无法存储
        
//        NSArray *arr = [NSArray arrayWithObjects:@"a",@"j",@"b",@"d",@"b", nil];
//
//        // block 遍历数组
//        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//           NNLog(obj)
//            NSLog(@"%lu",idx);
//            if (idx == 1) {
//                // 用于暂停循环
//                *stop = YES;
//            }
//        }];
        
        
        //        NNLog(arr);
//        NNLog(arr[0])
        
        // 取指定对象第一次出现的下标
//        NSUInteger Uint = [arr indexOfObject:@"d"];
//        NSLog(@"%lu", Uint);
        
        
        // 注意点:可以避免,下标越界
        // 取第一个
       // NNLog(arr.firstObject)
        // 取最后一个
        //NNLog(arr.lastObject)
        
        // 取下标1
//        NSString * str = [arr objectAtIndex:1];
//
//        NNLog(str)
//
//        NSArray *arr1 = @[@"a",@"b",@"c",@"d",@"e"];
//        NNLog(arr1);
        
          //取数组数量
//        NSLog(@"%lu",(unsigned long)arr1.count);
        
        
//        //查找指定字符
//        BOOL res = [arr1 containsObject:@"c"];
//        NJLog(res)
//
//        Person *p1 = [Person new];
//        Person *p2 = [Person new];
//        Person *p3 = [Person new];
//        Person *p4 = [Person new];
//
//        NSArray *arr2 = @[p1,p2,p3,p4];
//        NNLog(arr2);
//
//        for (NSString *str in arr) {
//            NNLog(str)
//        }
        
        //NSArray 和 NSString
//        NSArray *arr = @[@"jack",@"rose",@"lili"];
//
//        // 将数组中的元素拼接起来
//        NSString *str = [arr componentsJoinedByString:@"-"];
//        NNLog(str)
        
//        NSString *str = @"北京,南京,上海";
//        // 将一个字符串按照指定格式分割成一个数组
//        NSArray *arr = [str componentsSeparatedByString:@","];
//
//        for (NSString *str1 in arr) {
//            NNLog(str1)
//        }
        
        // 注意NSMutableArray不支持这么创建
        //NSMutableArray *arr = @[@""];
        
//        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"jack",@"a1",@"a2",@"a3",@"a1",@"a2",@"a3", nil];
        
        // 删除下标范围0开始的第4个元素为a3的字符
//        [arr removeObject:@"a3" inRange:NSMakeRange(0, 4)];
//        NNLog(arr)
        
        //NSArray *arr1 = @[@"a1",@"a2",@"a3",@"a1",@"a2",@"a3"];
//        // 新增数组
//        [arr addObject:@"rose"];
//        NNLog(arr)
//        //将 arr1当做元素加到数组中
//        [arr addObject:arr1];
//        NNLog(arr)
//        // 将 arr1 中的元素取出来逐个加到 arr 中.
//        [arr addObjectsFromArray:arr1];
//        NNLog(arr)

        // 插入一个元素
       // [arr insertObject:@"lili" atIndex:1];
        //NNLog(arr)
        
        // 将数组中的元素逐个插入一个指定位置
//        NSRange range = NSMakeRange(1, [arr1 count]);
//        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
//        [arr insertObjects:arr1 atIndexes:indexSet];
       // NNLog(arr)
        
        // 删除一个元素
//        [arr removeObject:@"lili"];
//        NNLog(arr)
        
        // 删除指定下标的元素
//        [arr removeObjectAtIndex:1];
//        NNLog(arr)
        
        // 删除最后一个元素
//        [arr removeLastObject];
//        NNLog(arr)
        
        // 删除全部
//        [arr removeAllObjects];
        //NNLog(arr)
        
        // 将数据类型包装成 oc 对象类型
//        NSNumber *num = [NSNumber numberWithInt:100];
//
//        [arr addObject:num];
//        NNLog(arr)

//        NSArray *arr = @[@10,@20,@30,@40];
//
//        NSLog(@"%d",((NSNumber*)arr[0]).intValue);
//
//        for (NSNumber *num in arr) {
//
//            NSLog(@"%d",num.intValue);
//        }
        
//        int inum = 10;
//
//        // 把 int 类型的 inum 存储到 NSNumber 中,相当于把 int 类型转换为 NSNumber 类型的 int
//        // 注意点:如果是数据类型的值直接 @12 如果是变量那就必须使用 @(num) . 变量必须使用()包裹
//        NSNumber *num = @(inum);
//         NNLog(num)
        
        NSArray *arr = @[@"jack",@"rose",@"lili"];
        // 将数组保存到 plist 文件中
        [arr writeToFile:@"/Users/huig/Desktop/123.plist" atomically:NO];
        
        // 读取数组类型的 plist 文件
        NSArray *arr1 = [NSArray arrayWithContentsOfFile:@"/Users/huig/Desktop/123.plist"];
        NNLog(arr1)
        
        
        
        
        
        
    }
    return 0;
}
