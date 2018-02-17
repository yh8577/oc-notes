//
//  Qiang.m
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Qiang.h"

@implementation Qiang

- (void)callDanjia {
    
    if (!_danjia) {
        NSLog(@"子弹打光了,请换弹夹....");
        return;
    }
    if (_danjia.zidan <= 0) {
        _danjia = nil;
        NSLog(@"子弹打光了,请换弹夹....");
        return;
    }
    
    [_danjia callzidan];
}

@end
