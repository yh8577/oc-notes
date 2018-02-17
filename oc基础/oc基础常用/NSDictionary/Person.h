//
//  Person.h
//  NSDictionary
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,strong)NSString *name;

- (instancetype)initWithName:(NSString*)name;

@end
