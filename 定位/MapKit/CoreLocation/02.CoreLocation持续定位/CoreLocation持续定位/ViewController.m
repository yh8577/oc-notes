//
//  ViewController.m
//  CoreLocation持续定位
//
//  Created by jyh on 2018/3/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *maneger;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取对象
    self.maneger = [CLLocationManager new];
    
    // 请求授权
    if ([self.maneger respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.maneger requestWhenInUseAuthorization];
    }
    // 设置代理
    self.maneger.delegate = self;
    // 调用开始方法
    [self.maneger startUpdatingLocation];
    
    // 距离筛选器
    // 在超过出这个范围(米)在调用代理方法
    self.maneger.distanceFilter = 10;
    
    // 设置精确定位
    // iphone 中的定位方法 : Gps, Wifi, 移动基站
    // 我们可以减低精准度,实际上减低了与卫星直角的计算,以节省电量
    // kCLLocationAccuracyThreeKilometers 3公里定位一次
    
    self.maneger.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
}

#pragma mark -- CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%@",locations.lastObject);
}


@end
