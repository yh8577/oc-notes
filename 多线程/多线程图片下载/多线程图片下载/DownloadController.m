//
//  DownloadController.m
//  多线程图片下载
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "DownloadController.h"
#import "Download.h"
#import "DownloadCell.h"
#import "NSString+Sandbox.h"
@interface DownloadController ()
@property(nonatomic,strong)NSArray *imageData;

@end

@implementation DownloadController




- (NSArray *)imageData {
    if (!_imageData) {
        _imageData = [Download download];
    }
    return _imageData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.rowHeight = 100;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Download *model = self.imageData[indexPath.row];
    
    static NSString *imageCell = @"imageCell";
    DownloadCell *cell = [tableView dequeueReusableCellWithIdentifier:imageCell];

    cell.model = model;

    return cell;
}


- (void)didReceiveMemoryWarning {

}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
