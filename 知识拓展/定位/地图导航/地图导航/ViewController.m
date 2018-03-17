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
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *destinationTF;


@end

@implementation ViewController


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
        // 终点对的位置
        MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:mkpm];
        
        // openMapsWithItems 此方法可以打开系统自带的地图导航
        // 一个 MKMapItem 就是一个点
        NSDictionary *launchOption = @{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsMapTypeKey: @(MKMapTypeStandard),MKLaunchOptionsShowsTrafficKey:@(YES)};
        // launchOptions 参数,是一个字典
        [MKMapItem openMapsWithItems:@[destinationItem] launchOptions:launchOption];
        
    }];

}


- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
