//
//  Danjia.m
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Danjia.h"

@implementation Danjia

- (void)setZidanshuliang:(int)zidan {
    
    _zidan= zidan <= 100 && zidan > 0 ? zidan : 10;
}

- (void)callzidan {
    
    if (_zidan) {
        _zidan -= 1;
        NSLog(@"子弹还有%d", _zidan);
    }
    
}

@end
