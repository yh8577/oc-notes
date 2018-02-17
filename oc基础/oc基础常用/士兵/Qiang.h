//
//  Qiang.h
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Danjia.h"
@interface Qiang : NSObject
@property (nonatomic, strong)Danjia *danjia;
@property (nonatomic,strong)NSString *name;

- (void)callDanjia;

@end
