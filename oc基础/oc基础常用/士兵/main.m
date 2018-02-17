//
//  main.m
//  士兵
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shibing.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Danjia *dj = [[Danjia alloc] init];
        
        [dj setZidan:60];
        
        Shibing *sb = [[Shibing alloc] init];
        sb.name = @"许三多";
        
        Qiang *q = [[Qiang alloc] init];
        q.name = @"ak47";
        
        [q setDanjia:dj];
        
        [sb setQiang:q];
        
        
        for (int i = 1; i < 100; i++) {
            [sb tutu];
        }
        
        
        
    }
    return 0;
}
