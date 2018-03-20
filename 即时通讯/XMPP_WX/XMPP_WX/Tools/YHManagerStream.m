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


@interface YHManagerStream ()<XMPPStreamDelegate>

@end

@implementation YHManagerStream

static YHManagerStream *instance;
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YHManagerStream new];
        
        // 设置打印日志
        [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:XMPP_LOG_FLAG_SEND_RECV];
    });
    return instance;
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
    // 连接
    NSError *error;
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    
    if (error) {
        NSLog(@"error1 = %@",error);
    } else {
        self.password = password;
        NSLog(@"登录成功");
    }
}

// 返回连接结果的代理方法
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    
    NSLog(@"password = %@",self.password);
    
    NSError *error;
    // 认证
    [self.xmppStream authenticateWithPassword:self.password error:&error];
    
    // 可以注册,匿名登录(需要后台支持)
    //[self.xmppStream authenticateAnonymously:nil];
    //[self.xmppStream registerWithPassword:nil error:nil];
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
