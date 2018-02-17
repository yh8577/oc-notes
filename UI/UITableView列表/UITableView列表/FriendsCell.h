//
//  FriendsCell.h
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZFriend;
@interface FriendsCell : UITableViewCell
@property(nonatomic,strong)CZFriend *friends;
+ (instancetype)friendsCellWithTableView:(UITableView *)tableView;

@end
