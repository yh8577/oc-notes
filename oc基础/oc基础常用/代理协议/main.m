//
//  main.m
//  代理协议
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boy.h"
#import "Girl.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Boy *b1 = [Boy new];
        b1.name = @"jack";
        b1.age = 19;
        b1.money = 999999999;
        
        
        Girl *fj = [Girl new];
        
        fj.name = @"fj";
        
        b1.girlFrirnd = fj;
        
        [b1 talkLove];
        
        
        NSLog(@"%d",b1.money);
        
        
        
    }
    return 0;
}
