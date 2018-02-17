//
//  CZTuanGouController.m
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZTuanGouController.h"
#import "CZTuanGou.h"
#import "CZTuanGouCell.h"
#import "CZFooterView.h"
#import "CZHeaderView.h"
@interface CZTuanGouController ()<UITableViewDataSource,UITableViewDelegate,CZFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *tuangouModel;
@end

@implementation CZTuanGouController

- (NSMutableArray *)tuangouModel {
    
    if (!_tuangouModel) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tg.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            CZTuanGou *model = [CZTuanGou tuangouWithDitc:dict];
            [arrM addObject:model];
        }
        _tuangouModel = arrM;
    }
    return _tuangouModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 60;
    
    CZFooterView *footerView = [CZFooterView footerView];
    footerView.delegate = self;
    
    self.tableView.tableFooterView = footerView;
    
    CZHeaderView *headerView = [CZHeaderView headerView];
    self.tableView.tableHeaderView = headerView;
    
}

#pragma mark -- CZFooterViewDelegate
- (void)footerViewUpData:(CZFooterView *)footerView {
    
    CZTuanGou *model = [[CZTuanGou alloc] init];
    
    model.icon = @"3";
    model.name = @"美女一个";
    
    [self.tuangouModel addObject:model];
    
    [self.tableView reloadData];
    
    NSIndexPath *indePath = [NSIndexPath indexPathForRow:self.tuangouModel.count - 1 inSection:0];
    // 刷新后把新数据滚动到上面来
    [self.tableView scrollToRowAtIndexPath:indePath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}



#pragma mark -- UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tuangouModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CZTuanGou *model = self.tuangouModel[indexPath.row];
 
    CZTuanGouCell *cell = [CZTuanGouCell tuangouCellWithTableView:tableView];

    cell.tuangouModel = model;
 
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
