//
//  main.m
//  NSRange
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //NSRange 这个结构体表示范围
        // 1.
        NSRange range2 = {.location = 3,.length = 4};
        // 2.
        NSRange range;
        range.location = 4;
        range.length = 7;
        // 3.
        NSRange range1 = {4, 7};
        // 4.
        NSRange range3 = NSMakeRange(3, 7);
        
        // 打印 NSRange 结构体
        NSLog(@"%@",NSStringFromRange(range));
        
        
    }
    return 0;
}
