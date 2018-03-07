//
//  MyAnnotationView.h
//  添加大头针
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotationView : MKAnnotationView
+ (instancetype)annotationView:(MKMapView*)mapView;
@end
