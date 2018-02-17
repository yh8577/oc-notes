//
//  XiangMuJingLi.m
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "XiangMuJingLi.h"

@implementation XiangMuJingLi

- (void)setName:(NSString *)name {
    
    if ([name length] < 2) {
        _name = @"无名";
        return;
    }
    _name = name;
}

- (void)setJiBenGongZhi:(int)jiBenGongZhi{
    
    _jiBenGongZhi = jiBenGongZhi >= 5000 && jiBenGongZhi <= 9000 ? jiBenGongZhi : 5000;
}

- (void)setXiangMuFenHong:(int)xiangMuFenHong {
    
    _xiangMuFenHong = xiangMuFenHong >= 10000 && xiangMuFenHong <= 20000 ? xiangMuFenHong : 10000;
}

- (void)setXiangMuJiangJin:(int)xiangMuJiangJin {
    
    _xiangMuJiangJin = xiangMuJiangJin >= 4000 && xiangMuJiangJin <= 9000 ? xiangMuJiangJin : 4000;
}

- (void)call {
    
    NSLog(@"名称:%@,工资: %d,分红: %d,奖金: %d", _name, _jiBenGongZhi, _xiangMuFenHong, _xiangMuJiangJin);
}

@end
