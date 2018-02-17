//
//  GroupHeaderView.h
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupHeaderView;

@protocol GroupHeaderViewDelegate <NSObject>

- (void)groupHeaderViewwDidClickTitleButton:(GroupHeaderView *)headerView;

@end

@class CZGroup;
@interface GroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) id<GroupHeaderViewDelegate> delegate;
@property(nonatomic,strong)CZGroup *groups;
+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;

@end
