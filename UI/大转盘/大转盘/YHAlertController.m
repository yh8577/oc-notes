//
//  YHAlertController.m
//  大转盘
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHAlertController.h"

@interface YHAlertController ()
@property(nonatomic,strong)UIWindow *alertWindow;
@end

@implementation YHAlertController

- (void)showAnimated:(BOOL)animated {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor clearColor]];
    UIViewController *rootViewController = [[UIViewController alloc] init];
    [[rootViewController view] setBackgroundColor:[UIColor clearColor]];
    // set window level
    [window setWindowLevel:UIWindowLevelAlert + 1];
    [window makeKeyAndVisible];
    [self setAlertWindow:window];
    [window setRootViewController:rootViewController];
    
    [rootViewController presentViewController:self animated:animated completion:nil];
}


+ (instancetype)presentOkayWithTitle:(NSString *)title message:(NSString *)message {
    
    YHAlertController *alertController = [YHAlertController        alertControllerWithTitle:title message:message      preferredStyle:UIAlertControllerStyleAlert];
    
    // present the alertController with animated
    [alertController showAnimated:YES];
    
    return alertController;
}


@end
