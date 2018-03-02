//
//  main.m
//  NSNULL
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];

//        [dicM setObject:nil forKey:@"key"]; // 会报错,因为不能为空
        
//        [dicM setObject:[NSNull null] forKey:@"key"];
//        [dicM setObject:@"" forKey:@"key"];
//        ""和[NSNull null]是完全不一样的
        
        NSLog(@"%@",dicM);
        
        
    }
    return 0;
}
