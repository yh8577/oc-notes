//
//  YHMUCRoomManager.h
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import <Foundation/Foundation.h>
@import XMPPFramework;
@interface YHMUCRoomManager : NSObject
// 多用聊天功能类
@property (nonatomic, strong) XMPPMUC *xmppMUC;
// 聊天室功能类
@property (nonatomic, strong) XMPPRoom *xmppRoom;

// 单例
+ (instancetype)sharedInstance;

//
- (void)joinOrCreateWithRoomJid:(XMPPJID *)roomJid andNickName:(NSString *)nickName;
@end
