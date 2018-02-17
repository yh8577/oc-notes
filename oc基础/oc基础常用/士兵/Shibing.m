//
//  Shibing.m
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Shibing.h"

@implementation Shibing

- (void)tutu {

    [_qiang callDanjia];
    if (_qiang.danjia) {
        NSLog(@"%@ 拿着 %@ 开枪了...突突突.",_name, _qiang.name);
    }

}

@end
