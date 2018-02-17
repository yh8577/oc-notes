//
//  main.m
//  NSValue
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        // 用来包装 CGPoint;,CGSize;,CGRect;
        // 包装成 oc 对象
        NSValue *v = [NSValue valueWithPoint:CGPointMake(1, 1)];
        NSValue *v1 = [NSValue valueWithSize:CGSizeMake(100, 100)];
        NSValue *v2 = [NSValue valueWithRect:CGRectMake(10, 10, 50, 50)];
        
        NSArray *arr = @[v,v1,v2];
        
        for (NSValue *v in arr) {
            
            NSLog(@"%@",v);
            NSLog(@"%@",NSStringFromPoint(v.pointValue));
            NSLog(@"%@",NSStringFromSize(v.sizeValue));
            NSLog(@"%@",NSStringFromRect(v.rectValue));
            
        }
        
        
        
        
    }
    return 0;
}
