//
//  WXMessageFrameModel.h
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#define textFont  [UIFont systemFontOfSize:12]
@class WXMessageModel;

@interface WXMessageFrameModel : NSObject
@property(nonatomic,strong)WXMessageModel *messageModel;
@property(nonatomic,assign,readonly)CGRect timeFrame;
@property(nonatomic,assign,readonly)CGRect textFrame;
@property(nonatomic,assign,readonly)CGRect iconFrame;
@property(nonatomic,assign,readonly)CGFloat rowHeight;

@end
