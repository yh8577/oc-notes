//
//  coding.h
//  持久化存储
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coding : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *tel;
@end
