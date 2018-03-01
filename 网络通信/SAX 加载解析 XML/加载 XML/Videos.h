//
//  Videos.h
//  加载 XML
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Videos : NSObject
// 在网络模型中使用 kvc一般都用 copy 否则 kvc 转换的时候有可能出现空字符串
@property(nonatomic,copy)NSNumber *videoId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *length;
@property(nonatomic,copy)NSString *videoURL;
@property(nonatomic,copy)NSString *imageURL;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *teacher;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)videosyWithDict:(NSDictionary *)dict;
@end
