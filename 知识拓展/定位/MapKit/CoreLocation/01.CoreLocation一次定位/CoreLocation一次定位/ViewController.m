//
//  ViewController.m
//  CoreLocation一次定位
//
//  Created by jyh on 2018/3/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController


#pragma mark -- CLLocationManagerDelegate


/**
 当完成位置更新的时候调用

 @param manager CLLocationManager
 @param locations 返回一个CLLocation的数组
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [locations enumerateObjectsUsingBlock:^(CLLocation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%zd == %zd",obj.coordinate.latitude,obj.coordinate.longitude);
        // 停止定位
        //[self.manager stopUpdatingLocation];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建 CLLocationManager 对象
    self.manager = [CLLocationManager new];
    // 请求用户授权 --> 必须请求用户授权
    // 方法2
    // 适配系统版本,获取系统版本号做判断
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
//
//    }
    // 方法1,判断方法是否可以调用
    // 使用期间授权 , 当程序使用的时候调用
    // info.plist 要添加key NSLocationWhenInUseUsageDescription
    //
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    // 始终授权 程序在后台也还会调用
    // info.plist 要添加key NSLocationAlwaysAndWhenInUseUsageDescription 
//    if ([self.manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
//        [self.manager requestAlwaysAuthorization];
//    }
    
    // ios9 开始才可以临时和获取后台定位权限
    // 然后打开Xcode -> Targets -> Capabilities 中的Background Modes并勾选其中的Location updates选项
    // info.plist 要添加key Required background modes : App registers for location updates
    // 注意点:这个是 ios9 新增的需要做一下系统版本判断
    if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
        self.manager.allowsBackgroundLocationUpdates = YES;
    }
    
    // 设置代理 - >获取用户位置
    self.manager.delegate = self;
    // 调用开始位置方法
    [self.manager startUpdatingLocation];
    
}































@end
