//
//  PieChart.h
//  饼图封装
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChart : UIView
@property(nonatomic,strong)NSArray *values;
+ (instancetype)pieChartView;
@end
