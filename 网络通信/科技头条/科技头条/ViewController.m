//
//  ViewController.m
//  科技头条
//
//  Created by jyh on 2018/2/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *newsList;
@end

@implementation ViewController

- (void)setNewsList:(NSArray *)newsList {
    _newsList = newsList;
    // 拿到数据后刷新 tableView
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl.tintColor =  [UIColor blackColor];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]  initWithString:@"正在刷新...." attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] }];
    
    self.tableView.rowHeight  = 100;
    /*
     http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1519355163/type/0?channel=appstore&uuid=79014CD9-5BC4-4CA2-AA6D-FE004D37C12F&net=5&model=iPhone&ver=1.0.5
     */
    [self loadNews];
}
- (IBAction)loadNews {

    [NewsModel loadNewsWithSuccess:^(NSArray *newsList) {
        self.newsList = newsList;
    } erroe:^{
        NSLog(@"获取数据失败");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%zd",self.newsList.count);
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NewsModel *model = self.newsList[indexPath.row];
    
    NewsCell *cell = [NewsCell newsCellWithTableView:tableView model:model];
    
    cell.model = model;
    
    return cell;
}


@end

































