//
//  ViewController.m
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHImageModel.h"
#import "YHShowImageCell.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *imageData;
@end

@implementation ViewController

- (NSArray *)imageData {
    if (!_imageData) {
        _imageData = [YHImageModel imageModelWithPlistName:@"imageData"];
    }
    return _imageData;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHShowImageCell *cell = [YHShowImageCell imageCellWithTableView:tableView];
    YHImageModel *model = self.imageData[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
