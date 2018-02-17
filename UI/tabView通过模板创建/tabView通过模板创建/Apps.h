//
//  Apps.h
//  通过模板创建 tableView
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Apps : NSObject

@property(nonatomic,copy)NSString *download;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,assign)BOOL isDownload;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appsWithDict:(NSDictionary *)dict;

@end
