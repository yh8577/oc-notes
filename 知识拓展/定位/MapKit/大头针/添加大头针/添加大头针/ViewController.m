//
//  ViewController.m
//  添加大头针
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotationModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取坐标
    CGPoint point = [[touches anyObject] locationInView:self.mapView];
    
    // 将坐标点转换成经纬度
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    // 创建大头针
    MyAnnotationModel *annotationModel = [MyAnnotationModel new];
    annotationModel.coordinate = coordinate;

    
    // 添加到地图上
    [self.mapView addAnnotation:annotationModel];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error || placemarks.count == 0) {
            NSLog(@"error = %@",error);
            return ;
        }
        CLPlacemark *placemark = placemarks.lastObject;

        annotationModel.title = placemark.locality;
        annotationModel.subtitle = placemark.name;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导入 MapKit 框架
    // MKUserLocation - > 大头针模型
    
    // 添加大头针 -> 需要自定义大头针模型类
    
    // 创建大头针
    MyAnnotationModel *annotationModel = [MyAnnotationModel new];
    annotationModel.coordinate = CLLocationCoordinate2DMake(24.46, 118.1);
    annotationModel.title = @"厦门市";
    annotationModel.subtitle = @"一个美丽的鹭岛";
    
    // 添加到地图上
    [self.mapView addAnnotation:annotationModel];
    
    // 创建大头针
    MyAnnotationModel *annotationModel1 = [MyAnnotationModel new];
    annotationModel1.coordinate = CLLocationCoordinate2DMake(24.52, 117.35);
    annotationModel1.title = @"漳州市";
    annotationModel1.subtitle = @"一个吃货的城市";
    
    // 添加到地图上
    [self.mapView addAnnotation:annotationModel1];
    
}


@end
