//
//  FriendsCell.m
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "FriendsCell.h"
#import "CZFriend.h"
@implementation FriendsCell


+ (instancetype)friendsCellWithTableView:(UITableView *)tableView {
    
    static NSString *cell_id = @"cell_id";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[FriendsCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cell_id];
    }
    return cell;
}

- (void)setFriends:(CZFriend *)friends {
    
    _friends = friends;
    
    self.imageView.image = [UIImage imageNamed:friends.icon];
    self.textLabel.text = friends.name;
    self.detailTextLabel.text = friends.intro;
    NSLog(@"%d",friends.vip);
    
    self.textLabel.textColor = friends.vip ? [UIColor redColor] : [UIColor blackColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
