//
//  Model.h
//  json转模型
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(nonatomic,copy)NSString *message;
// 注意点,这里不要用 int 类型.因为服务器有可能返回空.那就会报错.用NSNumber可以解决这个问题
//@property(nonatomic,assign)int messageId;
@property(nonatomic,strong)NSNumber *messageId;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
