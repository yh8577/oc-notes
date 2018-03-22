//
//  YHRecentlyTableViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHRecentlyTableViewController.h"
#import "YHManagerStream.h"
#import "YHChatViewController.h"
@interface YHRecentlyTableViewController ()<NSFetchedResultsControllerDelegate,XMPPvCardAvatarDelegate>
// 查询控制器
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
// 好友列表数据
@property (nonatomic, strong) NSArray *recentlyArrs;
@end

@implementation YHRecentlyTableViewController

- (NSArray *)recentlyArrs {
    if (!_recentlyArrs) {
        _recentlyArrs = [NSArray array];
    }
    return _recentlyArrs;
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"XMPPMessageArchiving_Contact_CoreDataObject" inManagedObjectContext:[XMPPMessageArchivingCoreDataStorage sharedInstance].mainThreadManagedObjectContext];
        [fetchRequest setEntity:entity];
        // Specify criteria for filtering which objects to fetch
        
       // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"subscription = %@", @"both"];
       // [fetchRequest setPredicate:predicate];
        // Specify how the fetched objects should be sorted
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"mostRecentMessageTimestamp" ascending:NO];
        fetchRequest.sortDescriptors = @[sortDescriptor];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[XMPPMessageArchivingCoreDataStorage sharedInstance].mainThreadManagedObjectContext sectionNameKeyPath:nil cacheName:@"Recently"];
        // 设置代理
        _fetchedResultsController.delegate = self;
    }
    return _fetchedResultsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSFetchedResultsController deleteCacheWithName:@"Recently"];
    
    // 设置代理
    [[YHManagerStream sharedInstance].xmppVCardAvatarModule addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    // 获取数据
    NSError *err;
    [self.fetchedResultsController performFetch:&err];
    if (err) {
        NSLog(@"获取好友失败 = %@",err);
    }
    self.recentlyArrs = self.fetchedResultsController.fetchedObjects;
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    
    XMPPMessageArchiving_Contact_CoreDataObject *contact  = self.recentlyArrs[[self.tableView indexPathForCell:cell].row];

    YHChatViewController *chatVC = segue.destinationViewController;
    chatVC.userJid = contact.bareJid;
    
}

#pragma mark -- NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    self.recentlyArrs = self.fetchedResultsController.fetchedObjects;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recentlyArrs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMPPMessageArchiving_Contact_CoreDataObject *contact = self.recentlyArrs[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Recently_cell" forIndexPath:indexPath];
    
    UIImageView *iconView = [cell viewWithTag:1001];
    iconView.image = [UIImage imageWithData:[[YHManagerStream sharedInstance].xmppVCardAvatarModule photoDataForJID:contact.bareJid]];
    
    UILabel *nameLabel = [cell viewWithTag:1002];
    nameLabel.text = contact.bareJidStr;
    
    UILabel *lastMessage = [cell viewWithTag:1003];
    lastMessage.text = [NSString stringWithFormat:@"最近信息:%@,%@",contact.mostRecentMessageBody,contact.mostRecentMessageTimestamp];

    
    
    return cell;
}

- (void)xmppvCardAvatarModule:(XMPPvCardAvatarModule *)vCardTempModule didReceivePhoto:(UIImage *)photo forJID:(XMPPJID *)jid {
    [self.tableView reloadData];
}
@end

