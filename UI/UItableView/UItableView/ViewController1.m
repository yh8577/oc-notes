//
//  ViewController1.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController1

static NSString *reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 1;
            break;
       case 1:
            return 2;
            break;
       default:
            return 3;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"第一组,第%ld行",indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"第二组,第%ld行",indexPath.row];
            break;
        default:
            cell.textLabel.text = [NSString stringWithFormat:@"第三组,第%ld行",indexPath.row];
            break;
    }
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"第一组,组头";
            break;
        case 1:
            return @"第二组,组头";
            break;
        default:
            return @"第三组,组头";
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"第一组,组尾";
            break;
        case 1:
            return @"第二组,组尾";
            break;
        default:
            return @"第三组,组尾";
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  100;
}





@end
