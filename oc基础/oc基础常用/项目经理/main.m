//
//  main.m
//  项目经理
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XiangMuJingLi.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        XiangMuJingLi *x = [[XiangMuJingLi alloc] init];
        
        [x setName:@"jack"];
        
        [x setJiBenGongZhi:3000];
        
        [x setXiangMuFenHong:10000];
        
        [x setXiangMuJiangJin:5000];
        
        [x call];
        
        
    }
    return 0;
}
