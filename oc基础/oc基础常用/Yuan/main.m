//
//  main.m
//  Yuan
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Yuan.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Yuan *y = [[Yuan alloc] init];
        
        [y setRadius:100];
        
        [y mianJi];
        
        [y zhouChang];
        
    }
    return 0;
}
