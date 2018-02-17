//
//  main.m
//  CGPoint
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 几种使用方式
        CGPointMake(1, 5);// 坐标
        
        CGPoint p;
        p.x = 1;
        p.y= 1;
        
        CGPoint p1 = {1,1};
        NSLog(@"%@",NSStringFromPoint(p1));
        CGPoint p2 = {.x =1, .y =2};
        NSLog(@"%@",NSStringFromPoint(p2));
        NSMakePoint(1, 1);
        
        NSPoint p3;
        p3.x = 1;
        NSLog(@"%@",NSStringFromPoint(p3));
        NSPoint p4 = {.x =1, .y = 1};
        NSLog(@"%@",NSStringFromPoint(p4));
        
        CGSizeMake(100, 100); // 宽高
        CGSize s;
        s.width = 100;
        
        CGSize s1 = {100 ,100};
        NSLog(@"%@",NSStringFromSize(s1));
        CGSize s2 = {.width = 100, .height = 100};
         NSLog(@"%@",NSStringFromSize(s2));
        NSMakeSize(100, 100);
        
        NSSize s3 = {100 ,100};
         NSLog(@"%@",NSStringFromSize(s3));
        NSSize s4 = {.width = 100, .height = 100};
         NSLog(@"%@",NSStringFromSize(s4));
        NSSize s5;
        s5.width = 100;
        
        
        CGRectMake(1, 5, 100, 100); //坐标,宽高
        CGRect r = {1,1,100,100};
        NSLog(@"%@",NSStringFromRect(r));
        
        CGRect r1;
        r1.origin = CGPointMake(1, 1);
        r1.origin.x = 1;
        r1.size = CGSizeMake(100, 100);
        r1.size.width = 100;
        NSLog(@"%@",NSStringFromRect(r1));
        NSRect r2;
        r2.size = NSMakeSize(100, 100);
        NSLog(@"%@",NSStringFromRect(r2));
        NSMakeRect(1, 1, 100, 100);
        
        // cg 和 ns 其实两个都一样有相似的方法.

        
        
    }
    return 0;
}
