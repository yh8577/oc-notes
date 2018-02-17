//
//  Selller.h
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"
#import "Goods.h"

@interface Seller : Person
@property(nonatomic,retain)Goods *sp;

- (instancetype)initWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender andSp:(Goods *)sp;
+ (instancetype)seller;

+ (instancetype)sellerWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender andSp:(Goods *)sp;
@end
