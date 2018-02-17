//
//  Person.h
//  Copy
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>

@property(nonatomic,copy)NSString *name;
//{
//    NSString *_name;
//}
//
//- (void)setName:(NSString *)name;
//
//- (NSString *)name;
@end
