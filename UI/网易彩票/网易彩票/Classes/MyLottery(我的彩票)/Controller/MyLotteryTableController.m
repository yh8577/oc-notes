//
//  MyLotteryTableController.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "MyLotteryTableController.h"
#import "YHSttingTableController.h"
#import "YHHelpController.h"
@interface MyLotteryTableController ()
@property (weak, nonatomic) IBOutlet UIButton *loginLopttery;


@end

@implementation MyLotteryTableController

- (IBAction)sttingClick:(id)sender {
    
    YHSttingTableController *setting = [[YHSttingTableController alloc] initWithStyle:(UITableViewStyleGrouped)];
    setting.plistName = @"Setting";
    setting.navigationItem.title = @"设置";
    
    UIBarButtonItem *helpBtn = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:(UIBarButtonItemStylePlain) target:self action:@selector(helpClick)];
    setting.navigationItem.rightBarButtonItem = helpBtn;
    [self.navigationController pushViewController:setting animated:YES];
    
}

- (void)helpClick {
    
    YHHelpController *help = [[ YHHelpController alloc] init];
    
    [self.navigationController pushViewController:help animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    UIImage *image = [UIImage imageNamed:@"RedButtonPressed"];
    
    // 纯代码切割图片 和在 图片里面设置效果一样
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height*0.5];
    
    [self.loginLopttery setBackgroundImage:image forState:(UIControlStateHighlighted)];
    
    
}



- (IBAction)loginLopttery:(id)sender {
    
}
@end
