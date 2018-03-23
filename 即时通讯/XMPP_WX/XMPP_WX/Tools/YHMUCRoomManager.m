//
//  YHMUCRoomManager.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHMUCRoomManager.h"
#import "YHManagerStream.h"
@interface YHMUCRoomManager ()<XMPPMUCDelegate,XMPPRoomDelegate>
@property (nonatomic, strong) NSMutableDictionary *roomDict;
@end
@implementation YHMUCRoomManager

static YHMUCRoomManager *sharedInstance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [YHMUCRoomManager new];
    });
    return sharedInstance;
}

- (NSMutableDictionary *)roomDict {
    if (!_roomDict) {
        _roomDict = [NSMutableDictionary dictionary];
    }
    return _roomDict;
}

// 多用聊天功能类
- (XMPPMUC *)xmppMUC {
    if (!_xmppMUC) {
        _xmppMUC = [[XMPPMUC alloc] initWithDispatchQueue:dispatch_get_main_queue()];
        // 设置代理
        [_xmppMUC addDelegate:self delegateQueue:dispatch_get_main_queue()];
        // 激活
        [_xmppMUC activate:[YHManagerStream sharedInstance].xmppStream];
    }
    return _xmppMUC;
}
// 聊天室功能类
- (XMPPRoom *)xmppRoom {
    if (!_xmppRoom) {
        _xmppRoom = [[XMPPRoom alloc] initWithDispatchQueue:dispatch_get_main_queue()];
    }
    return _xmppRoom;
}

// 加入聊天室
- (void)joinOrCreateWithRoomJid:(XMPPJID *)roomJid andNickName:(NSString *)nickName {
    // 创建房间
    XMPPRoom *room = [[XMPPRoom alloc] initWithRoomStorage:[XMPPRoomCoreDataStorage sharedInstance] jid:roomJid dispatchQueue:dispatch_get_main_queue()];
    // 设置代理
    [room addDelegate:self delegateQueue:dispatch_get_main_queue()];
    // 激活
    [room activate:[YHManagerStream sharedInstance].xmppStream];
    // 将房间存放在数组中
    self.roomDict[roomJid] = room;
    // 加入房间,如果房间不存在会创建,存在则直接加入
    [room joinRoomUsingNickname:nickName history:nil];
}

- (void)xmppRoomDidJoin:(XMPPRoom *)sender {
    // 需要对房间进行配置
    [sender configureRoomUsingOptions:nil];
    
    //    [sender fetchConfigurationForm];
    [sender inviteUser:[XMPPJID jidWithUser:@"yh8577" domain:@"www.huig.com" resource:nil] withMessage:@"期待您加入聊天室"];
}

- (void)xmppRoomDidCreate:(XMPPRoom *)sender {
    

}

@end



















