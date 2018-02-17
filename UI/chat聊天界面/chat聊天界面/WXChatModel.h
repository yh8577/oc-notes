//
//  WXChatModel.h
//  chat聊天界面
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>


// 注意点:枚举默认为0开始
typedef enum {
    WXChatModelTypeOther,
    WXChatModelTypeMe,
}messageType;

@interface WXChatModel : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)messageType type;
@property(nonatomic,assign)BOOL hideTime;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)chatModelWithDict:(NSDictionary *)dict;

@end
