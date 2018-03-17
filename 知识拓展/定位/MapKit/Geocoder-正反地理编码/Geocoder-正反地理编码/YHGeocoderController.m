 //
//  YHGeocoderController.m
//  Geocoder-正反地理编码
//
//  Created by jyh on 2018/3/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHGeocoderController.h"
#import <CoreLocation/CoreLocation.h>
@interface YHGeocoderController ()
/**
 地址
 */
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
/**
 经度
 */
@property (weak, nonatomic) IBOutlet UILabel *longitudeLbl;
/**
 纬度
 */
@property (weak, nonatomic) IBOutlet UILabel *latitudeLbl;
/**
 地址
 */
@property (weak, nonatomic) IBOutlet UILabel *addressLbl;

@end

@implementation YHGeocoderController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (IBAction)geocoderClick:(id)sender {
    NSLog(@"aaaaaa");
    // 创建对象
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:self.addressTF.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // placemarks 地标数组
        if (!placemarks.count || error) {
            NSLog(@"error : %@",error);
            self.addressLbl.text = @"没有找到...";
            return ;
        }
        NSMutableString *str = [NSMutableString string];
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSLog(@"name: %@, %f - %f",obj.name ,obj.location.coordinate.latitude,obj.location.coordinate.longitude);

            self.longitudeLbl.text = [NSString stringWithFormat:@"%f",obj.location.coordinate.longitude];
            self.latitudeLbl.text = [NSString stringWithFormat:@"%f",obj.location.coordinate.latitude];
            /*
             ocean 太平洋
             inlandWater 湖
             ISOcountryCode ISO国家代码
             country 国家
             locality 城市
             subLocality 子城市
             thoroughfare 街道名称
             subThoroughfare 子街道
             administrativeArea 行政区
             subAdministrativeArea 县
             postalCode 邮政编码
             */
            
            [str appendString:@"["];
//            [str appendFormat:@"ocean: %@ ->",obj.ocean];
//            [str appendFormat:@"inlandWater: %@ ->",obj.inlandWater];
//            [str appendFormat:@"inlandWater: %@ ->",obj.ISOcountryCode];
            
            [str appendFormat:@"%lu : %@",idx ,obj.country];
            [str appendFormat:@" -> %@",obj.administrativeArea];
            [str appendFormat:@" -> %@",obj.locality];
            [str appendFormat:@" -> %@",obj.subLocality?obj.subLocality:@""];
//            [str appendFormat:@" %@, ->",obj.thoroughfare];
//            [str appendFormat:@"subThoroughfare: %@ ->",obj.subThoroughfare];
//            [str appendFormat:@"subAdministrativeArea: %@ ->",obj.subAdministrativeArea];
//            [str appendFormat:@"postalCode: %@ ->",obj.postalCode];
            [str appendString:@"]\r\n"];
            
            
        }];
        
        self.addressLbl.text = str;
    }];
}


@end
