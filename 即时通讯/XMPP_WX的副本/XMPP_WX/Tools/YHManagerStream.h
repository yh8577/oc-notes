//
//  YHManagerStream.h
//  XMPP_WX
//
//  Created by jyh on 2018/3/20.
//  Copyright © 2018年 huig. All rights reserved.
//

#import <Foundation/Foundation.h>
@import XMPPFramework;
@interface YHManagerStream : NSObject
// Stream  流
@property (nonatomic, strong) XMPPStream *xmppStream;
// 保存密码
@property (nonatomic, copy) NSString *password;
// 自动重连
@property (nonatomic, strong) XMPPReconnect *xmppReconnect;
// 心跳检测
@property (nonatomic, strong) XMPPAutoPing *xmppAutoPing;
// 好友列表
@property (nonatomic, strong) XMPPRoster *xmppRoster;
// 好友消息
@property (nonatomic, strong) XMPPMessageArchiving *xmppMessageArchiving;

// 单例
+ (instancetype)sharedInstance;

// 连接方法
- (void)loginToServer:(XMPPJID *)myJid andPassword:(NSString *)password;
@end
