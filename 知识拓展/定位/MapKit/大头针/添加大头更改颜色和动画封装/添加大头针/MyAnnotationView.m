//
//  MyAnnotationView.m
//  添加大头针
//
//  Created by jyh on 2018/3/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "MyAnnotationView.h"
#import "MyAnnotationModel.h"
@implementation MyAnnotationView

+ (instancetype)annotationView:(MKMapView*)mapView {
    static NSString *myView_id = @"myView_id";
    MyAnnotationView *annoView = (MyAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:myView_id];
    if (!annoView) {
        annoView = [[MyAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:myView_id];
        
        // 设置左右附属视图
        // 如果自定义附属视图,canShowCallout会默认为NO那么就不能显示title,必须将 canShowCallout属性设置改为yes.
        annoView.canShowCallout = YES;
        annoView.leftCalloutAccessoryView = [UISwitch new];
        annoView.rightCalloutAccessoryView = [UISwitch new];
        // ios9之定义详情,子标题
        //annoView.detailCalloutAccessoryView = [UISwitch new];
    }
    
    return annoView;
}

#pragma mark - annotation 的 set 方法

- (void)setAnnotation:(id<MKAnnotation>)annotation {
    // 如果重写必须调用 [super setAnnotation:annotation]
    [super setAnnotation:annotation];
    
    // 添加自定义大头针头像
    MyAnnotationModel *myModel = annotation;
    self.image = [UIImage imageNamed:myModel.icon];
}

@end
