//
//  AppDelegate.m
//  3种window的方法
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    /*
    //代码创建
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    */
    
    /*
    //UIStoryboard加载 window
    UIStoryboard *vc = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *stVC = [vc instantiateInitialViewController];
    self.window.rootViewController = stVC;
    */
    /*
     //   Storyboard 的 Identifier id 加载
    UIStoryboard *vc = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *stVC = [vc instantiateViewControllerWithIdentifier:@"label"];
    self.window.rootViewController = stVC;
    */
    
    // xib 创建
    
    /*
    //方法1
    // 注意点:要指定xib 的之定义类文件名和  file.s Owner 里面的 View 为当前的 xib 的 view 窗口
    ViewController *vc = [[ViewController alloc] initWithNibName:@"tabView" bundle:nil];
    self.window.rootViewController = vc;
    */
    
    // 方法2
    // 注意点:  xib 名称和控制器类名称相同,这种方法会先找名称最相近的 xib.
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
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
