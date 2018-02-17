//
//  AppTableViewController.m
//  通过模板创建 tableView
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "AppTableViewController.h"
#import "Apps.h"
#import "AppCell.h"
@interface AppTableViewController () <AppCellDelegate>
@property(nonatomic,strong)NSArray *apps;
@end

@implementation AppTableViewController

- (NSArray *)apps {
    if (!_apps) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];

        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            Apps *app = [Apps appsWithDict:dict];
            [arrM addObject:app];
        }
        
        _apps = arrM;
    }
    return _apps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     NSArray *arr = @[
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天酷跑",@"icon":@"m_2_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天爱消除",@"icon":@"m_3_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天k歌",@"icon":@"m_4_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天酷",@"icon":@"m_5_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天跑",@"icon":@"m_6_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天酷跑",@"icon":@"m_7_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"酷跑",@"icon":@"m_8_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天跑",@"icon":@"m_9_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天酷",@"icon":@"m_10_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天酷跑",@"icon":@"m_2_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天爱消除",@"icon":@"m_3_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天k歌",@"icon":@"m_4_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天酷",@"icon":@"m_5_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天天跑",@"icon":@"m_6_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天酷跑",@"icon":@"m_7_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"酷跑",@"icon":@"m_8_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天跑",@"icon":@"m_9_100"},
     @{@"size":@"10.8M",@"download":@"189.8万",@"name":@"天酷",@"icon":@"m_10_100"}
     ];
    
    [arr writeToFile:@"/Users/huig/Desktop/tabView通过模板创建/tabView通过模板创建/app.plist" atomically:NO];
*/
    
    self.tableView.rowHeight = 60;
}


- (void)appCellDidClickDownloadbutton:(AppCell *)appCell {
    
    UILabel *showLbl = [[UILabel alloc] init];
    CGFloat lblW = 200;
    CGFloat lblH = 30;
    CGFloat lblX = (self.view.bounds.size.width - lblW) / 2;
    CGFloat lblY = (self.view.bounds.size.height - lblH) / 2;
    showLbl.frame = CGRectMake(lblX, lblY, lblW, lblH);
    showLbl.textAlignment = NSTextAlignmentCenter;
    showLbl.backgroundColor = [UIColor grayColor];
    showLbl.font = [UIFont systemFontOfSize:14];
    showLbl.layer.cornerRadius = 5;
    showLbl.layer.masksToBounds = YES;
    showLbl.text = @"正在下载";
    showLbl.textColor = [UIColor redColor];
    showLbl.alpha = 0;
    // 注意点: 这里是 tableView 直接加到这里面会跟随 tableview 滚动
//    [self.view addSubview:showLbl];
    // 直接添加到主 控制器 中
    [[[UIApplication sharedApplication] keyWindow] addSubview:showLbl];
    
    [UIView animateWithDuration:1.0 animations:^{
        showLbl.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.0 delay:1.0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                showLbl.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [showLbl removeFromSuperview];
                }
            }];
        }
    }];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Apps *appMmodel = self.apps[indexPath.row];
    
    static NSString *app_id = @"app_id";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:app_id];
    
    cell.delegate = self;

    cell.appsModel = appMmodel;
    
    return cell;
}




@end
