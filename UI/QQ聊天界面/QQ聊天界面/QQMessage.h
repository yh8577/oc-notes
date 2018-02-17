//
//  QQMessage.h
//  QQ聊天界面
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    QQMessageTypeMe = 0,
    QQMessageTypeOther = 1
} QQMessageType;

@interface QQMessage : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)QQMessageType type;
@property(nonatomic,assign)BOOL hideTime;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageWithDict:(NSDictionary *)dict;


@end
