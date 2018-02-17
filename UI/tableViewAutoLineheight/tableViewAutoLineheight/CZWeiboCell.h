//
//  CZWeiboCell.h
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZWeiboFrameModel;
@interface CZWeiboCell : UITableViewCell
@property(nonatomic,strong)CZWeiboFrameModel *modelFrame;

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView;
@end
