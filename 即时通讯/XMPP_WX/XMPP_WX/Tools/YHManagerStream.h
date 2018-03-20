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
@property (nonatomic, copy) NSString *password;

+ (instancetype)sharedManager;

//
- (void)loginToServer:(XMPPJID *)myJid andPassword:(NSString *)password;
@end
