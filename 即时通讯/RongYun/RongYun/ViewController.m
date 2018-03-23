//
//  ViewController.m
//  RongYun
//
//  Created by jyh on 2018/3/23.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "YHChatListViewController.h"
@interface ViewController ()<RCIMUserInfoDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[RCIM sharedRCIM] initWithAppKey:@"kj7swf8ok1hu2"];
    
    [[RCIM sharedRCIM] connectWithToken:@"zNx10cQ1UjKLrnxjNv/scXxVtdBXci5LyvhlP8MHDkDbhumUj+0gtURbh9bXL0gbG7uBW9cWA1ZRVVpagx7uvQ=="     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            YHChatListViewController *chatList = [[YHChatListViewController alloc] init];
            [self.navigationController pushViewController:chatList animated:YES];
        });
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%zd", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    

}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *userInfo))completion {
    if ([userId isEqualToString:@"002"]) {
        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
        userInfo.name = @"老王二";
        userInfo.userId = @"002";
        return completion(userInfo);
    }
    if ([userId isEqualToString:@"001"]) {
        RCUserInfo *userInfo = [[RCUserInfo alloc] initWithUserId:@"001" name:@"老王一" portrait:nil];
        return completion(userInfo);
    }
}

@end
