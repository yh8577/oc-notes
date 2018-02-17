//
//  CZTuanGouCell.h
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZTuanGou.h"
@interface CZTuanGouCell : UITableViewCell
@property(nonatomic,strong)CZTuanGou *tuangouModel;
+ (instancetype)tuangouCellWithTableView:(UITableView *)tableView;
@end
