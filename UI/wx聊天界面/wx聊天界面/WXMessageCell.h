//
//  WXMessageCell.h
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXMessageFrameModel;
@interface WXMessageCell : UITableViewCell
@property(nonatomic,strong)WXMessageFrameModel *messageFrameModel;
+ (instancetype)messageCellWithTableView:(UITableView *)tableView;


@end
