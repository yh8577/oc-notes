//
//  ViewController.m
//  百度地图
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
@interface ViewController ()<BMKMapViewDelegate,BMKPoiSearchDelegate>
{
    BMKMapView *_mapView;
    BMKPoiSearch *_searcher;
    BMKLocationService *_locService;
}
@end

@implementation ViewController

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (!annotationView) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.pinColor = BMKPinAnnotationColorPurple;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        annotationView.draggable = YES;
        return annotationView;
    }
    return nil;
}

//实现PoiSearchDeleage处理回调结果
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResultList errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        
        [poiResultList.poiInfoList enumerateObjectsUsingBlock:^(BMKPoiInfo *poiInfo, NSUInteger idx, BOOL * _Nonnull stop) {
            
            BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
            annotation.coordinate = poiInfo.pt;
            annotation.title = poiInfo.name;
            annotation.subtitle = [NSString stringWithFormat:@"%@%@",poiInfo.address,poiInfo.phone];
            [_mapView addAnnotation:annotation];
        }];
    }
    else if (error == BMK_SEARCH_AMBIGUOUS_KEYWORD){
        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
        // result.cityList;
        NSLog(@"起始点有歧义");
    }
    else {
        NSLog(@"抱歉，未找到结果");
        NSLog(@"%zd",error);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.view = _mapView;
    
    
//    [_mapView setMapType:BMKMapTypeStandard]; //切换为标准地图
    // 设置地图显示层级
    [_mapView setZoomLevel:15];

    //打开实时路况图层 setTrafficEnabled
    [_mapView setTrafficEnabled:YES];

    //打开百度城市热力图图层（百度自有数据）
    [_mapView setBaiduHeatMapEnabled:YES];
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = CLLocationCoordinate2DMake(30.62385, 117.5071);
    annotation.title = @"这里是池州";
    [_mapView addAnnotation:annotation]; 
    
    _mapView.showsUserLocation = YES;//显示定位图层
//    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态为普通定位模式
    
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;

    [self performSelector:@selector(poiSearch) withObject:nil afterDelay:2.0];
    
}


/**
 poi 检索
 */
- (void)poiSearch {
    //初始化搜索对象 ，并设置代理
    _searcher =[[BMKPoiSearch alloc]init];
    _searcher.delegate = self;
    //请求参数类BMKCitySearchOption
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = 0;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= @"池州";
    citySearchOption.keyword = @"小吃";
    //发起城市内POI检索
    BOOL flag = [_searcher poiSearchInCity:citySearchOption];
    if(flag) {
        NSLog(@"城市内检索发送成功");
    }
    else {
        NSLog(@"城市内检索发送失败");
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _searcher.delegate = nil;
}


@end
