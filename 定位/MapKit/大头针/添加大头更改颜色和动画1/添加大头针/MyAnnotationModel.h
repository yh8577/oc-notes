//
//  MyAnnotationModel.h
//  添加大头针
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//
/**
 导入框架 #import <MapKit/MapKit.h>
 遵守协议 MKAnnotation
 设置属性 -> 直接到协议中拷贝然后删除 readonly
 */
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotationModel : NSObject<MKAnnotation>
// 必须有
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
// 可有可无
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;


@end
