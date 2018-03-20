//
//  ViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/20.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "ViewController.h"
#import "YHManagerStream.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[YHManagerStream sharedManager] loginToServer:[XMPPJID jidWithUser:@"huig" domain:@"www.huig.com" resource:nil] andPassword:@"123"];
    
}


@end
