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
        NSLog(@"纬度 %f == 经度 %f",obj.coordinate.latitude,obj.coordinate.longitude);
        [self.manager stopUpdatingLocation];
    }];
    
}

// 比较两个坐标的直线距离
- (void)test1 {
    
    // 创建坐标点
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:40 longitude:116];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:34 longitude:108];
    
    // 比较两个点的直线距离,返回的单位是米
    CLLocationDistance distance = [location1 distanceFromLocation:location2];
    
    // 换算为公里
    NSLog(@"%f 公里", distance / 1000);
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建 CLLocationManager 对象
    self.manager = [CLLocationManager new];
    // 请求用户授权 --> 必须请求用户授权
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    // 设置代理 - >获取用户位置
    self.manager.delegate = self;
    // 调用开始位置方法
    [self.manager startUpdatingLocation];
    
    [self test1];
    
}































@end
