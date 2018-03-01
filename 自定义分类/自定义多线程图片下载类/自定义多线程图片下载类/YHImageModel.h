//
//  YHImageModel.h
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHImageModel : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)imageModelWithDict:(NSDictionary *)dict;
+ (NSArray *)imageModelWithPlistName:(NSString *)plistName;
@end
