//
//  YHNewsController.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNewsController.h"
#import "YHNews.h"
#import "YHNewsCell.h"
#import "DetailsController.h"
@interface YHNewsController ()
@property (nonatomic, strong) NSArray *news;
@end

@implementation YHNewsController

- (void)setNews:(NSArray *)news {
    _news = news;
    [self.tableView reloadData];
}

- (void)setUrlString:(NSString *)urlString {
    self.news = nil;
    [YHNews newsListWithURLString:urlString successBlock:^(NSArray *news) {
        self.news = news;
    } errorBlock:^{
        NSLog(@"获取网络数据错误");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 100;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    YHNews *news = self.news[indexPath.row];

    if ([segue.identifier isEqualToString:@"details"]) {
        DetailsController *details = segue.destinationViewController;
        details.docid = news.docid;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHNews *news = self.news[indexPath.row];

    YHNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[YHNewsCell getRuseId:news] forIndexPath:indexPath];

    cell.news = news;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YHNews *news = self.news[indexPath.row];
    return [YHNewsCell getRowheigth:news];
}


@end
