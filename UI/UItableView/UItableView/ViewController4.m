//
//  ViewController4.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController4.h"
#import "CZYXModel.h"
@interface ViewController4 ()<UITableViewDataSource,UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *yxArr;
@end

@implementation ViewController4

- (NSArray *)yxArr {
    if (!_yxArr) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"yx.plist" ofType:nil];
        
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in tempArr) {
            
            CZYXModel *model = [CZYXModel yxWithDict:dict];
            
            [arrM addObject:model];
            
        }
        
        _yxArr = arrM;
    }
    
    return  _yxArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

/*
 ios9 开始废去.
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex == 1) {
        CZYXModel *model = self.yxArr[alertView.tag];
        model.name = [alertView textFieldAtIndex:0].text;
        [self.tableView reloadData];
    }
    
}
*/
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
     CZYXModel *model = self.yxArr[indexPath.row];
    
    /*
      ios9 开始废去.
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"修改信息" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertV.alertViewStyle = UIAlertViewStylePlainTextInput;
    alertV.tag = indexPath.row;
    [alertV textFieldAtIndex:0].text = model.name;
    
    [alertV show];
    */
    

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改信息" message:nil preferredStyle:(UIAlertControllerStyleAlert)];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {

//        textField.placeholder = model.name;
        textField.text = model.name;

    }];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {

//        textField.placeholder = model.icon;
        textField.text = model.icon;

    }];

    UIAlertAction *exit = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

        UITextField *textF = alert.textFields.firstObject;
        UITextField *textF1 = alert.textFields.lastObject;
        model.name = textF.text;
        model.icon = textF1.text;
//        [tableView reloadData];®
        // 局部刷新,刷新指定的行
        NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationFade)];
    }];

    [alert addAction:ok];
    [alert addAction:exit];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.yxArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    
    CZYXModel *model = self.yxArr[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    
    return cell;
    
}


@end
