//
//  YHAlertController.h
//  大转盘
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHAlertController : UIAlertController

- (void)showAnimated:(BOOL)animated; // 显示 animated = NO or YES

+ (instancetype)presentOkayWithTitle:(NSString *)title message:(NSString *)message;

@end
