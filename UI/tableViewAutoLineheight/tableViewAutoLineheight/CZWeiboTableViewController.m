//
//  CZWeiboTableViewController.m
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZWeiboTableViewController.h"
#import "CZWeiboModel.h"
#import "CZWeiboCell.h"
#import "CZWeiboFrameModel.h"

@interface CZWeiboTableViewController ()
@property(nonatomic,strong)NSArray *weiboFrames;

@end

@implementation CZWeiboTableViewController

#pragma mark -- 懒加载数据
- (NSArray *)weiboFrames {
    if (!_weiboFrames) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            CZWeiboModel *model = [CZWeiboModel weiboModelWithDict:dict];
            CZWeiboFrameModel *modelFrame = [[CZWeiboFrameModel alloc] init];
            
            modelFrame.weibo = model;
            
            [arrM addObject:modelFrame];
        }
        _weiboFrames = arrM;
    }
    return _weiboFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiboFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CZWeiboFrameModel *model = self.weiboFrames[indexPath.row];
    CZWeiboCell *cell = [CZWeiboCell weiboCellWithTableView:tableView];
    
    cell.modelFrame = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    CZWeiboFrameModel *modelFrame = self.weiboFrames[indexPath.row];
    return modelFrame.rowHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
