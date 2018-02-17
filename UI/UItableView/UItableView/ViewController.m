//
//  ViewController.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

static NSString *CellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.dataSource = self;
    // 如果第一个控件是 tableview 那就要关闭这个否者下移64
    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark - ***************** UITableViewDataSource *****************

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];

    return cell;
    
    
}

@end
