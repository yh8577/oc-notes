//
//  CZQQFriendsTableViewController.m
//  UITableView列表
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZQQFriendsTableViewController.h"
#import "CZGroup.h"
#import "CZFriend.h"
#import "FriendsCell.h"
#import "GroupHeaderView.h"
@interface CZQQFriendsTableViewController () <GroupHeaderViewDelegate>

@property(nonatomic,strong)NSArray *groups;

@end

@implementation CZQQFriendsTableViewController

- (NSArray *)groups {
    
    if (!_groups) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Friends.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            
            CZGroup *groupModel = [CZGroup groupWithDict:dict];
            
            [arrM addObject:groupModel];
            
        }
        
        _groups = arrM;
    }
    
    return _groups;
}



- (void)viewDidLoad {
    [super viewDidLoad];
 
    /*
    NSArray *arr = @[
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@1},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@1},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@1},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@1},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@0}
                               ],
                       @"name":@"我的好友",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@1},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@0}
                               ],
                       @"name":@"朋友",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"同事",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"幼儿园",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"小学",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"初中",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"高中",
                       @"online":@3},
                     @{@"friends":@[
                               @{@"icon":@"m_2_100",@"intro":@"个性签名这么拽1",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_3_100",@"intro":@"个性签名这么拽2",@"name":@"huig",@"vip":@0},
                               @{@"icon":@"m_4_100",@"intro":@"个性签名这么拽3",@"name":@"huig",@"vip":@1}
                               ],
                       @"name":@"大学",
                       @"online":@3}
                     ];
    
    [arr writeToFile:@"/Users/huig/Desktop/UITableView列表/UITableView列表/Friends.plist" atomically:NO];
    
   */
    
    self.tableView.sectionHeaderHeight = 44;
    
}

- (void)groupHeaderViewwDidClickTitleButton:(GroupHeaderView *)headerView {

    // 这里不需要全部刷新,只需要局部刷新就可以了.
    NSIndexSet *indexS = [NSIndexSet indexSetWithIndex:headerView.tag];
    [self.tableView reloadSections:indexS withRowAnimation:(UITableViewRowAnimationFade)];
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CZGroup *group = self.groups[section];
    
    GroupHeaderView *groupHeaderView = [GroupHeaderView groupHeaderViewWithTableView:tableView];
    
    groupHeaderView.delegate = self;
    
    groupHeaderView.tag = section;
    
    groupHeaderView.groups = group;
    
    return groupHeaderView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CZGroup *group = self.groups[section];
    
    if (group.visible) {
        
        return group.friends.count;
    } else {
        
        return 0;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CZGroup *group = self.groups[indexPath.section];
    CZFriend *friend = group.friends[indexPath.row];
    
    FriendsCell *cell = [FriendsCell friendsCellWithTableView:tableView];
    
    cell.friends = friend;
    
    return cell;
}


@end
