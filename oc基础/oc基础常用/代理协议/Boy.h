//
//  Boy.h
//  代理协议
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFProtocol.h"
@interface Boy : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)int money;
@property(nonatomic,strong)id<GFProtocol> girlFrirnd;


- (void)talkLove;

@end
