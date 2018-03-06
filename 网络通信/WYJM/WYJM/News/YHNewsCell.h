//
//  YHNewsCell.h
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHNews;
@interface YHNewsCell : UITableViewCell
@property (nonatomic, strong) YHNews *news;
+ (NSString *)getRuseId:(YHNews *)news;
+ (CGFloat)getRowheigth:(YHNews *)news;
@end
