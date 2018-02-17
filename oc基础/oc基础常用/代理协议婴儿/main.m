//
//  main.m
//  婴儿
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby.h"
#import "Nanny.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Baby *b = [Baby new];
        b.name = @"小帅哥";
        b.age = 1;
        Nanny *n = [Nanny new];
        b.nanny = n;
        
        [b cry];
        [b babySleep];
        

    }
    return 0;
}
