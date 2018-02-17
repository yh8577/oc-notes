//
//  CZWeiboFrameModel.h
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreGraphics/CoreGraphics.h"
#import <UIKit/UIKit.h>
#define textFont [UIFont systemFontOfSize:14]

@class CZWeiboModel;
@interface CZWeiboFrameModel : NSObject
@property(nonatomic,strong)CZWeiboModel *weibo;
@property(nonatomic,assign,readonly)CGRect iconFrame;
@property(nonatomic,assign,readonly)CGRect nameFrame;
@property(nonatomic,assign,readonly)CGRect textFrame;
@property(nonatomic,assign,readonly)CGRect picFrame;
@property(nonatomic,assign,readonly)CGFloat rowHeight;
@end
