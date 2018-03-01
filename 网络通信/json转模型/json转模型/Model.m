//
//  Model.m
//  json转模型
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ { messageId: %d, message: %@}",[super description],self.messageId.intValue,self.message];
}
@end
