//
//  YHSettingCell.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHSettingCell.h"
#import "YHItemsMmodel.h"

@implementation YHSettingCell

- (void)setItem:(YHItemsMmodel *)item {
    
    _item = item;
    
    self.accessoryView = [[UISwitch alloc] init];
    if (item.icon && item.icon.length > 0) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    
    self.detailTextLabel.text = item.subTitle;
    self.textLabel.text = item.title;
    if (item.isRed) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    
    Class classType = NSClassFromString(item.accessoryView);
    UIView *obj = [[classType alloc] init];
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView*)obj;
        imageView.image = [UIImage imageNamed:item.accessoryContent];
        [imageView sizeToFit];
    } else if ([obj isKindOfClass:[UISwitch class]]) {
        UISwitch *switcher = (UISwitch *)obj;
        [switcher addTarget:self action:@selector(switchClick:) forControlEvents:(UIControlEventValueChanged)];
        NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
        
        switcher.on = [us boolForKey:item.switchKey];
    }
    self.accessoryView = obj;
}

- (void)switchClick:(UISwitch *)sender {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    [us setBool:sender.isOn forKey:self.item.switchKey];
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView withItem:(YHItemsMmodel *)item {
    
    // 注意点: 存在多种不同样式的 cell 配置不同的 id
    NSString *cellid = @"";
    if (item.cellType && item.cellType.length > 0) {
        cellid = item.cellType;
    } else {
        cellid = @"setting_cell";
    }

    YHSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[YHSettingCell alloc] initWithStyle:([self loadcellStyleWithItem:item]) reuseIdentifier:cellid];
    }
    return cell;
}

+ (UITableViewCellStyle)loadcellStyleWithItem:(YHItemsMmodel *)item {
    
    if ([item.cellType isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    } else if ([item.cellType isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    } else if ([item.cellType isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    } else {
        return UITableViewCellStyleDefault;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
