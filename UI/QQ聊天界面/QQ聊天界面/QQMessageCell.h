//
//  QQMessageCell.h
//  QQ聊天界面
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQMessageFrame;
@interface QQMessageCell : UITableViewCell

@property(nonatomic,strong)QQMessageFrame *messageaFrame;
+ (instancetype)messageWithTableView:(UITableView *)tableView;

@end
