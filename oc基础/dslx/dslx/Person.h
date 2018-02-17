//
//  Person.h
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male,
    female
} Gender;

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)Gender gender;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)int height;

- (instancetype)initWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender;
+ (instancetype)person;
+ (instancetype)personWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender;
@end
