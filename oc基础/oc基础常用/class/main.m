//
//  main.m
//  class
//
//  Created by jyh on 2018/1/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       
        Person *p = [[Person alloc] init];
        
        p.name = @"jack";
        
        
        
        NSString *str = @"jack";
        NSLog(@"str = %p", str);
        NSString *str1 = @"jack";
        NSLog(@"str1 = %p", str1);
        
        NSString *str2 = [NSString new];
        NSLog(@"str2 = %p", str2);
        
        NSString *str3 = [[NSString alloc] init];
        NSLog(@"str3 = %p", str3);
        
        NSString *str4 = [NSString string];
        NSLog(@"str4 = %p", str4);
        
        
    }
    return 0;
}
