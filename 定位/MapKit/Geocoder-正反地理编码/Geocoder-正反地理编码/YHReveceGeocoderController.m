//
//  YHReveceGeocoderController.m
//  Geocoder-正反地理编码
//
//  Created by jyh on 2018/3/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHReveceGeocoderController.h"
#import <CoreLocation/CoreLocation.h>
@interface YHReveceGeocoderController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTF;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTF;
@property (weak, nonatomic) IBOutlet UILabel *addressLbl;

@end

@implementation YHReveceGeocoderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)addressClick:(id)sender {
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:[self.latitudeTF.text doubleValue] longitude:[self.longitudeTF.text doubleValue]];
    
    CLGeocoder *geocoder = [CLGeocoder new];
    
    // 反地理方法
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if (error || placemarks.count == 0) {
            self.addressLbl.text = @"没有找到";
            NSLog(@"error = %@",error);
            return ;
        }
        
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

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
            
            NSMutableString *str = [NSMutableString string];
            //            [str appendFormat:@"ocean: %@ ->",obj.ocean];
            //            [str appendFormat:@"inlandWater: %@ ->",obj.inlandWater];
            //            [str appendFormat:@"inlandWater: %@ ->",obj.ISOcountryCode];
            [str appendFormat:@" %@ ->",obj.country];
            [str appendFormat:@" %@ ->",obj.administrativeArea];
            [str appendFormat:@" %@ ->",obj.locality];
            [str appendFormat:@" %@ ->",obj.subLocality];
            [str appendFormat:@" %@",obj.thoroughfare?obj.thoroughfare:@""];
            //            [str appendFormat:@"subThoroughfare: %@ ->",obj.subThoroughfare];
            //            [str appendFormat:@"subAdministrativeArea: %@ ->",obj.subAdministrativeArea];
            //            [str appendFormat:@"postalCode: %@ ->",obj.postalCode];
            
            self.addressLbl.text = str;
        }];
        
    }];
    
}


@end
