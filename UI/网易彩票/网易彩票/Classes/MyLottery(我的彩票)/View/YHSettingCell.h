//
//  YHSettingCell.h
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHItemsMmodel;
@interface YHSettingCell : UITableViewCell
@property(nonatomic,strong)YHItemsMmodel *item;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView withItem:(YHItemsMmodel *)item;
@end
