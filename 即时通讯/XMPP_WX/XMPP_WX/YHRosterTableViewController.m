//
//  YHRosterTableViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHRosterTableViewController.h"
#import "YHManagerStream.h"
#import "YHChatViewController.h"

@interface YHRosterTableViewController ()<NSFetchedResultsControllerDelegate,XMPPRosterDelegate>
// 查询控制器
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

// 好友列表数据
@property (nonatomic, strong) NSArray *rosterArrs;

@property (nonatomic, strong) UITextField *friends;

@end

@implementation YHRosterTableViewController

- (NSArray *)rosterArrs {
    if (!_rosterArrs) {
        _rosterArrs = [NSArray array];
    }
    return _rosterArrs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     
    // 设置好友代理
    [[YHManagerStream sharedInstance].xmppRoster addDelegate:self delegateQueue:dispatch_get_global_queue(0, 0)];
    // 获取数据
    NSError *err;
    [self.fetchedResultsController performFetch:&err];
    if (err) {
        NSLog(@"获取好友失败 = %@",err);
    }
    self.rosterArrs = self.fetchedResultsController.fetchedObjects;
    [self.tableView reloadData];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"XMPPUserCoreDataStorageObject" inManagedObjectContext:[XMPPRosterCoreDataStorage sharedInstance].mainThreadManagedObjectContext];
        [fetchRequest setEntity:entity];
        // Specify criteria for filtering which objects to fetch
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"subscription = %@", @"both"];
        [fetchRequest setPredicate:predicate];
        // Specify how the fetched objects should be sorted
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"jidStr" ascending:YES];
        fetchRequest.sortDescriptors = @[sortDescriptor];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[XMPPRosterCoreDataStorage sharedInstance].mainThreadManagedObjectContext sectionNameKeyPath:nil cacheName:@"Rosters"];
        // 设置代理
        _fetchedResultsController.delegate = self;
    }
    return _fetchedResultsController;
}
// 添加好友
- (IBAction)addFriends:(id)sender {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加好友" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    
    [alert addTextFieldWithConfigurationHandler:nil];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
         self.friends = alert.textFields.firstObject;
        NSLog(@"===%@",self.friends.text);
        [[YHManagerStream sharedInstance].xmppRoster addUser:[XMPPJID jidWithUser:self.friends.text domain:@"www.huig.com" resource:@"iOS_iphone 11"] withNickname:@"ls便天下"];
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    
    [alert addAction:actionOk];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    
    XMPPUserCoreDataStorageObject *user  = self.rosterArrs[[self.tableView indexPathForCell:cell].row];
    
    YHChatViewController *chatVC = segue.destinationViewController;
    chatVC.userJid = user.jid;
}

#pragma mark - XMPPRosterDelegate

- (void)xmppRoster:(XMPPRoster *)sender didReceivePresenceSubscriptionRequest:(XMPPPresence *)presence {
    // 同意添加对方为好友
    [[YHManagerStream sharedInstance].xmppRoster acceptPresenceSubscriptionRequestFrom:[XMPPJID jidWithUser:self.friends.text domain:@"www.huig.com" resource:@"iOS_iphone 11"] andAddToRoster:YES];
}

#pragma mark - FetchedResultsController Delegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    self.rosterArrs = self.fetchedResultsController.fetchedObjects;
    [self.tableView reloadData];

}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    XMPPUserCoreDataStorageObject *roster = self.rosterArrs[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[YHManagerStream sharedInstance].xmppRoster removeUser:roster.jid];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rosterArrs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMPPUserCoreDataStorageObject *roster = self.rosterArrs[indexPath.row];
    
    static NSString *Roster_cell = @"Roster_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Roster_cell forIndexPath:indexPath];
    UILabel *name = [cell viewWithTag:1002];
    name.text = roster.jidStr;
    
    return cell;
}



@end
