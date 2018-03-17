//
//  ViewController.m
//  地图导航
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *destinationTF;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [CLLocationManager new];
    // 创建授权
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    
    // 设置代理
    self.mapView.delegate = self;
}

- (IBAction)startNvigation:(id)sender {
    
    CLGeocoder *geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:self.destinationTF.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error || placemarks.count == 0) {
            NSLog(@"%@",error);
            return ;
        }
        
        // placemarks 可能返回多个地址,地名又可以出现多个
        // 这里就取最后一个
        CLPlacemark *pm = placemarks.lastObject;
        
        MKPlacemark *mkpm = [[MKPlacemark alloc] initWithPlacemark:pm];
        
        // 起点
        MKMapItem *sourceItem = [MKMapItem mapItemForCurrentLocation];
        NSLog(@"sourceItem == %@",sourceItem);
        // 终点对的位置
        MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:mkpm];
        NSLog(@"destinationItem = %@", destinationItem);
        
        // 实现画线
        // 导航/画线--> 跟苹果服务器发送请求
        // 创建一个方向请求对象
        MKDirectionsRequest *request = [MKDirectionsRequest new];
        // 设置起点
        request.source = sourceItem;
        // 设置终点
        request.destination = destinationItem;
        // 创建方向对象
        MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
        // 计算两个点的路线
        [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"error = %@",error);
            NSLog(@"count = %ld",response.routes.count);
            if (error || response.routes.count == 0) {
                NSLog(@"%@",error);
                return;
            }
            
            // 获取路线
            [response.routes enumerateObjectsUsingBlock:^(MKRoute * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                // 获取折线(多段线) polyline
                NSLog(@"%@",obj.polyline);
                MKPolyline *polyline = obj.polyline;
                
                // 添加到地图上
                // Overlay 遮盖物
                [self.mapView addOverlay:polyline];
            }];
        }];
    }];
    
}

#pragma mark -- 设置地图渲染物 实现 MKMapViewDelegate

/**
 当给地图添加遮盖物会调用该方法
 */
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    // 创建一个渲染物对象, MKPolylineRenderer 是 MKOverlayRenderer 的子类
    MKPolylineRenderer *polyline = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    // 设置颜色,必须设置,否则透明看不到
    polyline.strokeColor = [UIColor blueColor];
    polyline.lineWidth = 5;
    return polyline;
}






@end























