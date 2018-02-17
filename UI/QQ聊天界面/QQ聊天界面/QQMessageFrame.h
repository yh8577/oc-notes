//
//  QQMessageFrame.h
//  QQ聊天界面
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#define textFont  [UIFont systemFontOfSize:14]
@class QQMessage;
@interface QQMessageFrame : NSObject
@property(nonatomic,strong)QQMessage *message;

@property(nonatomic,assign,readonly)CGRect timeFrame;
@property(nonatomic,assign,readonly)CGRect iconFrame;
@property(nonatomic,assign,readonly)CGRect textFrame;
@property(nonatomic,assign,readonly)CGFloat rowHeight;
@end
