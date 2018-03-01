//
//  YHNetworkTool.h
//  模拟get和post登录
//
//  Created by jyh on 2018/2/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHNetworkTool : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pwd;

+ (instancetype)sharedNetworkTool;

- (void)getWithSuccess:(void(^)(void))success error:(void(^)(void))error;
- (void)postWithSuccess:(void(^)(void))success error:(void(^)(void))error;
@end
 
