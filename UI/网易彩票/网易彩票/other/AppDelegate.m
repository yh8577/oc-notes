//
//  AppDelegate.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "AppDelegate.h"
#import "YHTabBarController.h"
#import "YHGuideController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    self.window = [[UIWindow alloc] initWithFrame:kScreenSize];
    
    self.window.rootViewController = [self pickViewController];

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)pickViewController {
    
    if ([[self loadSaveAppVersion] isEqualToString:[self loadAppVersion]])
    {
        return [[YHTabBarController alloc] init];
    } else {
        [self saveAppVersion];
        return [[YHGuideController alloc] init];
    }
}

// 获取info版本号
- (NSString *)loadAppVersion {
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    return info[@"CFBundleShortVersionString"];
}

// 获取沙盒中保存的版本号
- (NSString *)loadSaveAppVersion {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"appVersion"];
}

// 获取info版本号,保存到沙盒
- (void)saveAppVersion {
    NSString *appVersion = [self loadAppVersion];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:appVersion forKey:@"appVersion"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
