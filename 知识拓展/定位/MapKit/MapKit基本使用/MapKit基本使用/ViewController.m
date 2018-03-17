//
//  ViewController.m
//  MapKit基本使用
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController
- (IBAction)mapTypeChangeClick:(UISegmentedControl *)sender {
    
    // 设置地图类型 mapType
    /*
     MKMapTypeStandard = 0,
     MKMapTypeSatellite,
     MKMapTypeHybrid,
     MKMapTypeSatelliteFlyover NS_ENUM_AVAILABLE(10_11, 9_0),
     MKMapTypeHybridFlyover NS_ENUM_AVAILABLE(10_11, 9_0),
     MKMapTypeMutedStandard
     */
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 3:
            self.mapView.mapType = MKMapTypeSatelliteFlyover;
            break;
        case 4:
            self.mapView.mapType = MKMapTypeHybridFlyover;
            break;
        case 5:
            self.mapView.mapType = MKMapTypeMutedStandard;
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.manager = [CLLocationManager new];
    
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    
    // 用户跟踪模式
    /*
     MKUserTrackingModeNone = 0,
     MKUserTrackingModeFollow,
     MKUserTrackingModeFollowWithHeading
     */
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    // 设置代理
    self.mapView.delegate = self;
    // ios9 新增属性
    // 设置交通状况
    self.mapView.showsTraffic = YES;
    // 设置指南针(默认yes)
    self.mapView.showsCompass = YES;
    // 设置比例尺
    self.mapView.showsScale = YES;
}

/**
 放大地图
 */
- (IBAction)zoomInClick:(id)sender {
    // 获取当前span的Delta的值缩小一倍
    CGFloat latitude = self.mapView.region.span.latitudeDelta * 0.5;
    CGFloat longitude = self.mapView.region.span.longitudeDelta * 0.5;
    //重设 region 属性
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.region.center,MKCoordinateSpanMake(latitude, longitude)) animated:YES];
}

/**
 缩小地图
 */
- (IBAction)zoomOutClick:(id)sender {
    // 获取当前span的Delta的值放大一倍
    CGFloat latitude = self.mapView.region.span.latitudeDelta * 2;
    CGFloat longitude = self.mapView.region.span.longitudeDelta * 2;
    //重设 region 属性
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.region.center,MKCoordinateSpanMake(latitude, longitude)) animated:YES];
}

/**
 返回用户所在位置
 @param sender UIButton
 */
- (IBAction)backUserLocationClick:(UIButton *)sender {
    // 设置中心点
//    self.mapView.centerCoordinate = self.mapView.userLocation.location.coordinate;
    // 设置范围
    // 获取坐标
    CLLocationCoordinate2D coordinate = self.mapView.userLocation.location.coordinate;
    // 范围
    // 1° = 111公里
    MKCoordinateSpan span = MKCoordinateSpanMake(0.025263, 0.016093);
    // 可以设置坐标也可以设置显示范围的跨度(大小)
    // 调用属性默认没有动画,想要有动画必须调用它的 set方法
//    self.mapView.region = MKCoordinateRegionMake(coordinate,span);
    // set 方法才有提供设置动画属性
    [self.mapView setRegion:MKCoordinateRegionMake(coordinate,span) animated:YES];

}


/**
 地图显示区域发生变化后,还会调用的方法

 @param mapView MKMapView
 @param animated animated
 */
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    //获取系统默认的显示大小
    NSLog(@"latitudeDelta: %f,longitudeDelta: %f",mapView.region.span.latitudeDelta,mapView.region.span.longitudeDelta);
    /*
     2018-03-08 03:25:25.770817+0800 MapKit基本使用[18227:3907106] latitudeDelta: 0.025263,longitudeDelta: 0.016093
     2018-03-08 03:25:29.239879+0800 MapKit基本使用[18227:3907106] latitudeDelta: 0.012631,longitudeDelta: 0.008047
     2018-03-08 03:25:32.166132+0800 MapKit基本使用[18227:3907106] latitudeDelta: 0.006316,longitudeDelta: 0.004023
     2018-03-08 03:25:33.684540+0800 MapKit基本使用[18227:3907106] latitudeDelta: 0.003158,longitudeDelta: 0.002012
     */
}

/**
 完成用户位置更新的时候调用

 @param mapView MKMapView
 @param userLocation 用户位置
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    // 设置头部信息
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if (error || placemarks.count == 0) {
            NSLog(@"error = %@",error);
            return ;
        }
        CLPlacemark *placemark = placemarks.lastObject;
        userLocation.title = placemark.locality;
        userLocation.subtitle = placemark.name;
    }];
    
}

@end
