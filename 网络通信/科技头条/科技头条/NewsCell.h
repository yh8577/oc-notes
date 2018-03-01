//
//  NewsCell.h
//  科技头条
//
//  Created by jyh on 2018/2/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsCell : UITableViewCell
@property(nonatomic,strong)NewsModel *model;
+ (instancetype)newsCellWithTableView:(UITableView *)tableView model:(NewsModel *)model;
@end
