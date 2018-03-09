//
//  ViewController.m
//  UMeng
//
//  Created by jyh on 2018/3/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <UShareUI/UShareUI.h>
#import <UMShare/UMShare.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)test {
    
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        
        // 根据获取的platformType确定所选平台进行下一步操作
        if (platformType == UMSocialPlatformType_Sina) {
            
            NSLog(@"%ld",(long)platformType);
            
            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
            
            messageObject.title = @"测试";
            messageObject.text = @"内容";
            
            NSLog(@"messageObject = %@",messageObject);
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:messageObject currentViewController: self completion:^(id result, NSError *error) {
                NSLog(@"shareToPlatform");
                NSLog(@"result = %@",result);
                NSLog(@"error = %@",error);
            }];
            
            [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
                
                NSLog(@"getUserInfoWithPlatform");
                NSLog(@"result = %@",result);
                NSLog(@"error = %@",error);
            }];
            
            
        }
        
    }];
}
- (IBAction)sinaLogin:(id)sender {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"Sina uid: %@", resp.uid);
            NSLog(@"Sina accessToken: %@", resp.accessToken);
            NSLog(@"Sina refreshToken: %@", resp.refreshToken);
            NSLog(@"Sina expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Sina name: %@", resp.name);
            NSLog(@"Sina iconurl: %@", resp.iconurl);
            NSLog(@"Sina gender: %@", resp.unionGender);
            
            // 第三方平台SDK源数据
            NSLog(@"Sina originalResponse: %@", resp.originalResponse);
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self test];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
