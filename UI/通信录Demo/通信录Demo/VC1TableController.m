//
//  VC1TableController.m
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "VC1TableController.h"
#import "ViewController1.h"
#import "Tel.h"
#import "EditController.h"
@interface VC1TableController ()<ViewController1Delegate>
@property(nonatomic,strong)NSMutableArray *arrM;

@end

@implementation VC1TableController

- (NSString *)filePath {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docPath stringByAppendingPathComponent:@"tel.data"];
    return filePath;
}

- (NSMutableArray *)arrM {
    if (!_arrM) {
        _arrM = [NSMutableArray array];
    }
    return _arrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftClick)];
    
    self.navigationItem.leftBarButtonItem = left;

    NSString *filePath = [self filePath];
    
    self.arrM = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
}

- (void)leftClick{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要注销吗?" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)viewController1:(ViewController1 *)viewController1 WithTel:(Tel *)tel {

    [self.arrM addObject:tel];

    [self.tableView reloadData];
    
    NSString *filePath = [self filePath];
    
    NSLog(@"%@",filePath);
    
    [NSKeyedArchiver archiveRootObject:self.arrM toFile:filePath];
    
}

// 这种方式性能可能会有一些影响
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    NSString *filePath = [self filePath];
    [NSKeyedArchiver archiveRootObject:self.arrM toFile:filePath];
}


// 这里是通过 edit 的代理方法实现刷新// 这种方法效率会比较高一点
//- (void)editController:(EditController *)editController {
//
//    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
//    [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationFade)];
//
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    // 方法1通过 identifier 判断跳转那个类
    /*
    if ([segue.identifier isEqualToString:@"edit"]) {
        EditController *edit = segue.destinationViewController;
//        edit.tel = tel;
    } else {
        ViewController1 *vc1 = segue.destinationViewController;
        vc1.delegate = self;
    }*/
    // 方法2
    UIViewController *vc = segue.destinationViewController;
    
    if ([vc isKindOfClass:([ViewController1 class])]) {
        ViewController1 *vc1 = (ViewController1*)vc;
        vc1.delegate = self;
    } else {
        EditController *edit = (EditController*)vc;
        
        // 获取当前点击的 cell
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        edit.tel = self.arrM[index.row];
        //edit.delegate = self;
    }
    
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *act = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"取消" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
    }];
    act.backgroundColor = [UIColor orangeColor];
    UITableViewRowAction *detele = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDefault) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            // 方法2
            [self.arrM removeObjectAtIndex:indexPath.row];
            // 删除指定tableview的行并刷新
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
            // 注意点: 删除某一行时务必先删除模型.
            NSString *filePath = [self filePath];
            [NSKeyedArchiver archiveRootObject:self.arrM toFile:filePath];
        
    }];
    return @[act,detele];
}

// 如果添加多个按钮,此方法无效.
// 进入编辑模式
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // 方法1
////    [self.arrM removeObject:self.arrM[indexPath.row]];
//    // 方法2
//    [self.arrM removeObjectAtIndex:indexPath.row];
//    
//    // 方法1,直接刷新数据
////    [self.tableView reloadData];
//    // 删除指定tableview的行并刷新
//    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
//   
//    // 注意点: 删除某一行时务必先删除模型.
//    
//    NSString *filePath = [self filePath];
//    [NSKeyedArchiver archiveRootObject:self.arrM toFile:filePath];
//    
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrM.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Tel *dict = self.arrM[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = dict.name;
    cell.detailTextLabel.text = dict.tel;
    
    return cell;
}


@end
