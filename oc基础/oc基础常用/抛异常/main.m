//
//  main.m
//  抛异常
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a = 0;
        int b = 1;
        
        // 抛出异常
        if (!(a == b)) {
            
            // 方法1
            [NSException raise:@"请检查 a 和 b" format:@"a 和 b 条件必须一致"];
            
            // 方法2
            //                NSException *ex = [NSException exceptionWithName:@"123" reason:@"321" userInfo:nil];
            //                [ex raise];
            
        }
        
    }
    return 0;
}
