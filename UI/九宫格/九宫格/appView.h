//
//  appView.h
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "appModel.h"
@interface appView : UIView

@property(nonatomic,strong)appModel *model;

+ (instancetype)appView;

@end
