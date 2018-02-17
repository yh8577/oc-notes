//
//  flagsPickView.h
//  picker_Demo3
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flags;
@interface flagsPickView : UIView
@property(nonatomic,strong)Flags *model;
+ (instancetype)flagsPickView;
@end
