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
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController

#pragma mark -- MKMapViewDelegate

/**
 只要添加了大头针模型,就会来到这个方法设置并返回对应的 view
 @param mapView mapView
 @param annotation annotation
 @return MKAnnotationView
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    // 判断是系统的 view 还是自定义的 view
    // 如果是系统的 view 就直接返回
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    // 自定义大头针 view --> 和自定义 cell 几乎一样
    static NSString *ID = @"annoView";
    // 默认没有没有图像,必须自己给 imageView 赋值
    // MKAnnotationView 有一个子类 ,MKPinAnnotationView.这个子类默认是有 View 的
    
    MKPinAnnotationView *annoView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (!annoView) {
        annoView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
        
        // 设置颜色
        /**
         MKPinAnnotationColorRed = 0,
         MKPinAnnotationColorGreen,
         MKPinAnnotationColorPurple
         */
        // 这个属性已经过期
        //annoView.pinColor = MKPinAnnotationColorGreen;
        // 新方法
        annoView.pinTintColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        
        // 设置动画
        annoView.animatesDrop = YES;
    }
    
    // 如果返回 nil 就代表用户没有自定义的需求,所有的 view 的样式由系统处理
    return annoView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.manager = [CLLocationManager new];
    
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.mapView.delegate = self;
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
