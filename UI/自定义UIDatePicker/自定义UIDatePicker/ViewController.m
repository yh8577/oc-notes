//
//  ViewController.m
//  自定义UIDatePicker
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textf;
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIToolbar *toolbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.textf.inputView = self.datePicker;
    self.textf.inputAccessoryView = self.toolbar;
}


- (UIToolbar *)toolbar {
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] init];
        _toolbar.frame = CGRectMake(0, 0, 0, 44);
        UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(cancelBtnClick)];
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:(UIBarButtonItemStylePlain) target:self action:@selector(domeBtnClick)];
    
        _toolbar.items = @[cancelBtn,flex,doneBtn];
    }
    
    return _toolbar;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}

- (void)domeBtnClick {
    
    NSDate *date = self.datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日 ";//HH:mm:ss
    
    NSString *str = [formatter stringFromDate:date];
    
    self.textf.text = str;
}

- (void)cancelBtnClick {
    [self.view endEditing:YES];
}


@end
