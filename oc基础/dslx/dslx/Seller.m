//
//  Selller.m
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Seller.h"

@implementation Seller

- (void)dealloc {
    
    NSLog(@"seller 销毁");
}

- (instancetype)initWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender andSp:(Goods *)sp{
    
    if (self = [super initWithName:name andAge:age andHeight:height andGender:gender]) {
        _sp = sp;
    }
    
    return self;
    
}

+ (instancetype)seller {
    return [super person];
}


+ (instancetype)sellerWithName:(NSString *)name andAge:(int)age andHeight:(int)height andGender:(Gender)gender andSp:(Goods *)sp {
    
    return [[self alloc] initWithName:name andAge:age andHeight:height andGender:gender andSp:sp];
    
}
@end
