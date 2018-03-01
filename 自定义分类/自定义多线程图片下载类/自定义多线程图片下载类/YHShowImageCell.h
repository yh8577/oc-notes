//
//  YHShowImageCell.h
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHImageModel;
@interface YHShowImageCell : UITableViewCell
@property(nonatomic,strong)YHImageModel *model;
+ (instancetype)imageCellWithTableView:(UITableView *)tableView;
@end
