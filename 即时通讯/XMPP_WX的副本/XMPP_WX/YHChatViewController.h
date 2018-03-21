//
//  YHChatViewController.h
//  XMPP_WX
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHManagerStream.h"
@interface YHChatViewController : UIViewController
// 接收目标jid
@property (nonatomic, strong) XMPPJID *userJid;

@end
