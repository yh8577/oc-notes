//
//  Girl.h
//  代理协议
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFProtocol.h"
@interface Girl : NSObject<GFProtocol>
@property(nonatomic,strong)NSString *name;


@end
