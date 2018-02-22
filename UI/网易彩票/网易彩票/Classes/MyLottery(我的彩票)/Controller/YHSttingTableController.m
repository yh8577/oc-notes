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

#import <MessageUI/MessageUI.h>


@interface YHSttingTableController ()<MFMessageComposeViewControllerDelegate>
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

// 跳转到应用程序
- (void)makeApp {
    NSLog(@"aaaaaaaaaaaaaaa");
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/wei-xin/id414478124?mt=8"];
    [app openURL:url];
}

// 跳转到应用商店
- (void)make {
    NSLog(@"aaaaaaaaaaaaaaa");
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/wei-xin/id414478124?mt=8"];
    [app openURL:url];
}

// 打电话
- (void)makeCell {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"tel://10010"];
    [app openURL:url];
}


// 发短信
- (void)makeSms {
    // 方法1 // 会跳转到系统发短信页面
//    UIApplication *app = [UIApplication sharedApplication];
//    NSURL *url = [NSURL URLWithString:@"sms://10010"];
//    [app openURL:url];
    
//    方法 2 // 直接在程序中打开短信功能
    MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc] init];
    message.messageComposeDelegate = self;
    message.body = @"你好";
    message.recipients = [NSArray arrayWithObject:@"13119677766"];
    
    [self presentViewController:message animated:YES completion:nil];
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    NSLog(@"短信回调");
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
