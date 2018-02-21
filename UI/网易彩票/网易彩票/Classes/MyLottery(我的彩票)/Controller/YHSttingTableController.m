//
//  YHSttingTableController.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHSttingTableController.h"
#import "YHGroupModel.h"
#import "YHItemsMmodel.h"
#import "YHRedViewController.h"
#import "YHSettingCell.h"
@interface YHSttingTableController ()
@property(nonatomic,strong)NSArray *groups;
@end

@implementation YHSttingTableController

- (instancetype)init {
    return [super initWithStyle:(UITableViewStyleGrouped)];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:(UITableViewStyleGrouped)];
}

- (NSArray *)groups {
    if (!_groups) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            YHGroupModel *model = [YHGroupModel groupWithDict:dict];
            [arrM addObject:model];
        }
        _groups = arrM;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:(UIBarButtonItemStylePlain) target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem = close;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHGroupModel *group = self.groups[indexPath.section];
    YHItemsMmodel *items = group.items[indexPath.row];
    
    if (items.targetVC && items.targetVC.length) {
        Class cls = NSClassFromString(items.targetVC);
        UIViewController *vc = [[cls alloc] init];
        if ([vc isKindOfClass:[YHSttingTableController class]]) {
            YHSttingTableController *setting = (YHSttingTableController*)vc;
            setting.plistName = items.plistName;
        }
        vc.navigationItem.title = items.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (items.funcName && items.funcName > 0) {
        // 把字符串包装成方法
        SEL funcName = NSSelectorFromString(items.funcName);

        /*
         忽略警告
         */
         #pragma clang diagnostic push
         #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:funcName];
         #pragma clang diagnostic pop
        
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    YHGroupModel *group = self.groups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    YHGroupModel *group = self.groups[section];
    return group.footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YHGroupModel *dict = self.groups[section];
    return dict.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHGroupModel *group = self.groups[indexPath.section];
    YHItemsMmodel *item = group.items[indexPath.row];
    
    YHSettingCell *cell = [YHSettingCell settingCellWithTableView:tableView withItem:item];
    cell.item = item;
    return cell;
}

- (void)checkUpdate {
    NSLog(@"你已经是最新的版本了");
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
