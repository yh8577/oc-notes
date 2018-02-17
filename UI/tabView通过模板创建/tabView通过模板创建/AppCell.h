//
//  AppCell.h
//  通过模板创建 tableView
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppCell;

@protocol AppCellDelegate <NSObject>
- (void)appCellDidClickDownloadbutton:(AppCell *)appCell;
@end

@class Apps;
@interface AppCell : UITableViewCell

@property (nonatomic, weak) id<AppCellDelegate> delegate;
@property(nonatomic,strong)Apps *appsModel;


@end
