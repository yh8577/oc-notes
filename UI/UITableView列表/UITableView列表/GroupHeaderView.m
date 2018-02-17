//
//  GroupHeaderView.m
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "GroupHeaderView.h"
#import "CZGroup.h"
@interface GroupHeaderView ()

@property (nonatomic,weak)UIButton *btnGroupTitle;
@property (nonatomic,weak)UILabel *lblCount;

@end


@implementation GroupHeaderView

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView {
    
    static NSString *header_id = @"header_id";
    GroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header_id];
    if (!headerView) {
        headerView = [[GroupHeaderView alloc] initWithReuseIdentifier:header_id];
    }
    
    return headerView;
}

- (void)setGroups:(CZGroup *)groups {
    
    _groups = groups;
    
    [self.btnGroupTitle setTitle:groups.name forState:(UIControlStateNormal)];
    
    self.lblCount.text = [NSString stringWithFormat:@"%d/%ld",groups.online,groups.friends.count];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.btnGroupTitle.frame = self.bounds;
    
    CGFloat lblW = 100;
    CGFloat lblH = self.bounds.size.height;
    CGFloat lblX = self.bounds.size.width - 10 - lblW;
    CGFloat lblY = 0;
    
    self.lblCount.frame = CGRectMake(lblX, lblY, lblW, lblH);
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *btnGroupTitle = [[UIButton alloc] init];
        [btnGroupTitle setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateNormal)];
        [btnGroupTitle setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btnGroupTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btnGroupTitle.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btnGroupTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btnGroupTitle addTarget:self action:@selector(btnGroupClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        
        UILabel *lblCount = [[UILabel alloc] init];
        [self.contentView addSubview:lblCount];
        self.lblCount = lblCount;
    }
    
    return self;
}

- (void)btnGroupClick {
    
    self.groups.visible = !self.groups.visible;
    
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewwDidClickTitleButton:)]) {
        [self.delegate groupHeaderViewwDidClickTitleButton:self];
    }
    
}


// view 被加载到父view 的时候会diao'y
- (void)didMoveToWindow {
    
    if (self.groups.visible) {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    } else {
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
