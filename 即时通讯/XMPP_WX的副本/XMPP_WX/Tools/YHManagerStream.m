//
//  YHManagerStream.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/20.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHManagerStream.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "XMPPLogging.H"


@interface YHManagerStream ()<XMPPStreamDelegate,XMPPRosterDelegate>

@end

@implementation YHManagerStream

static YHManagerStream *sharedInstance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [YHManagerStream new];
        
        // 设置打印日志
        [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:XMPP_LOG_FLAG_SEND_RECV];
    });
    return sharedInstance;
}

- (XMPPStream *)xmppStream {
    if (!_xmppStream) {
        _xmppStream = [[XMPPStream alloc] init];
        _xmppStream.hostName = @"127.0.0.1";
        _xmppStream.hostPort = 5222;
        // xmpp的代理是多播代理
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return _xmppStream;
}

// 登录服务器
- (void)loginToServer:(XMPPJID *)myJid andPassword:(NSString *)password {
    
    // 设置账号
    [self.xmppStream setMyJID:myJid];
    
    self.password = password;
    // 连接
    NSError *error;
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    
    [self activate];
    
    if (error) {
        NSLog(@"error1 = %@",error);
    } else {
        
        NSLog(@"登录成功");
    }
}

#pragma mark -- 功能模块
// 自动重连
- (XMPPReconnect *)xmppReconnect {
    if (!_xmppReconnect) {
        _xmppReconnect = [[XMPPReconnect alloc] initWithDispatchQueue:dispatch_get_main_queue()];;
        // 设置参数
        // 设置代理
        [_xmppReconnect addDelegate:self delegateQueue:dispatch_get_main_queue()];
        // 间隔时间
        _xmppReconnect.reconnectTimerInterval = 1;
    }
    return _xmppReconnect;
}

// 心跳检测
- (XMPPAutoPing *)xmppAutoPing {
    if (!_xmppAutoPing) {
        _xmppAutoPing = [[XMPPAutoPing alloc] initWithDispatchQueue:dispatch_get_main_queue()];
        // 设置参数
        // 设置代理
        [_xmppAutoPing addDelegate:self delegateQueue:dispatch_get_main_queue()];
        // 间隔时间
        _xmppAutoPing.pingInterval = 260;
    }
    return _xmppAutoPing;
}

// 好友花名册
- (XMPPRoster *)xmppRoster {
    if (!_xmppRoster) {
        _xmppRoster = [[XMPPRoster alloc] initWithRosterStorage:[XMPPRosterCoreDataStorage sharedInstance] dispatchQueue:dispatch_get_global_queue(0, 0)];
        // 设置参数
        // 是否自动更新好友
        _xmppRoster.autoFetchRoster = YES;
        
        // 是否自动删除用户存储的数据
        _xmppRoster.autoClearAllUsersAndResources = NO;
        
        // 是否自动加好友
        _xmppRoster.autoAcceptKnownPresenceSubscriptionRequests = NO;
        
        // 设置代理
        [_xmppRoster addDelegate:self delegateQueue:dispatch_get_global_queue(0, 0)];
    }
    return _xmppRoster;
}

// 消息模块
- (XMPPMessageArchiving *)xmppMessageArchiving {
    if (!_xmppMessageArchiving) {
        _xmppMessageArchiving = [[XMPPMessageArchiving alloc] initWithMessageArchivingStorage:[XMPPMessageArchivingCoreDataStorage sharedInstance] dispatchQueue:dispatch_get_main_queue()];
    }
    return _xmppMessageArchiving;
}

// 激活模块
- (void)activate {
    // 激活自动重连
    [self.xmppReconnect activate:self.xmppStream];
    
    // 激活心跳检测
    [self.xmppAutoPing activate:self.xmppStream];
    
    // 激活好友列表
    [self.xmppRoster activate:self.xmppStream];
    
    // 激活消息模块
    [self.xmppMessageArchiving activate:self.xmppStream];
    
}

// 返回连接结果的代理方法
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    
    
    // 认证
    NSError *error;
    [self.xmppStream authenticateWithPassword:self.password error:&error];
    
    // 可以注册,匿名登录(需要后台支持)
    //[self.xmppStream authenticateAnonymously:nil];
    [self.xmppStream registerWithPassword:self.password error:nil];
    if (error) {
        NSLog(@"error2 = %@",error);
    } else {
        NSLog(@"连接成功");
    }
}

// 返回认证结果的代理方法
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    
    // 设置出席
    XMPPPresence *presence = [XMPPPresence presence];
    
    // 出席状态
    [presence addChild:[DDXMLElement elementWithName:@"show" stringValue:@"dnd"]];
//    [presence addChild:[DDXMLElement elementWithName:@"status" stringValue:@"这是什么"]];
    
    // 通过 stream 发送给服务器
    [self.xmppStream sendElement:presence];
}

// 通过代理接收消息
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message {
    
    NSLog(@"===%@",message.body);
    if (message.body) {
        // 本地通知
        UILocalNotification *noti = [[UILocalNotification alloc] init];
        [noti setAlertBody:[NSString stringWithFormat:@"来自%@:%@",message.from,message.body]];
        [noti setApplicationIconBadgeNumber:1];
        // 弹出本地通知
        [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
    }
}
@end
