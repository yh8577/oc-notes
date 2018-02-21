//
//  YHLiveController.m
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHLiveController.h"
#import "UIView+Frame.h"
@interface YHLiveController ()
@property (nonatomic,weak)UIDatePicker *pick;

@end

@implementation YHLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return;
    }
    
    UITextField *text = [[UITextField alloc] init];

    // 添加到 cell 上
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell.contentView addSubview:text];
    
    UIDatePicker *pick = [[UIDatePicker alloc] init];
    self.pick = pick;
    pick.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    
    pick.datePickerMode = UIDatePickerModeTime;
    
    text.inputView = pick;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.height = 44;
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(cancelClick)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:(UIBarButtonItemStyleDone) target:self action:@selector(doneClick:)];
    
    toolbar.items = @[cancelItem,item,doneItem];
    
    text.inputAccessoryView = toolbar;
    // 设置为第一响应者
    [text becomeFirstResponder];
    
}

- (void)cancelClick {
    
    [self.view endEditing:YES];
}

- (void)doneClick:(UIBarButtonItem *)sender {
    
    NSDate *date = self.pick.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    NSString *time = [formatter stringFromDate:date];
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    
    cell.detailTextLabel.text = time;
    
    [self cancelClick];
}


@end
