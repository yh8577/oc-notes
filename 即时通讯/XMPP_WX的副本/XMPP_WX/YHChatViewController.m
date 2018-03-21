//
//  YHChatViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/21.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHChatViewController.h"

@interface YHChatViewController ()<NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,XMPPvCardAvatarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *sendMessageTF;
// 查询控制器
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSMutableArray *chatArrs;
@end

@implementation YHChatViewController

//- (NSMutableArray *)chatArrs {
//    if (!_chatArrs) {
//        _chatArrs = [NSMutableArray array];
//    }
//    return _chatArrs;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    [NSFetchedResultsController deleteCacheWithName:@"messages"];
    [self.fetchedResultsController performFetch:nil];
    [[YHManagerStream sharedInstance].xmppMessageArchiving addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    NSError *err;
    [self.fetchedResultsController performFetch:&err];
    self.chatArrs = (NSMutableArray *)self.fetchedResultsController.fetchedObjects;

    [self.tableView reloadData];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.chatArrs.count > 5) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.chatArrs.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//XMPPMessageArchiving_Message_CoreDataObject
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"XMPPMessageArchiving_Message_CoreDataObject" inManagedObjectContext:[XMPPMessageArchivingCoreDataStorage sharedInstance].mainThreadManagedObjectContext];
        [fetchRequest setEntity:entity];
        // Specify criteria for filtering which objects to fetch
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bareJidStr = %@", self.userJid.bare];
        [fetchRequest setPredicate:predicate];
        // Specify how the fetched objects should be sorted
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
        fetchRequest.sortDescriptors = @[sortDescriptor];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[XMPPMessageArchivingCoreDataStorage sharedInstance].mainThreadManagedObjectContext sectionNameKeyPath:nil cacheName:@"messages"];
        // 设置代理
        _fetchedResultsController.delegate = self;
    }
    return _fetchedResultsController;
}
#pragma mark
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
    self.chatArrs = (NSMutableArray *)[self.fetchedResultsController.fetchedObjects sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    [self.tableView reloadData];
    
    if (self.chatArrs.count > 5) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.chatArrs.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"self.chatArrs.count = %zd",self.chatArrs.count);
    return self.chatArrs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMPPMessageArchiving_Message_CoreDataObject *msg = self.chatArrs[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:msg.isOutgoing?@"Right_cell":@"Left_cell"];
    
    UILabel *messageLabel = [cell viewWithTag:1002];
    messageLabel.text = msg.body;
    
    return cell;
}

- (void)xmppvCardAvatarModule:(XMPPvCardAvatarModule *)vCardTempModule didReceivePhoto:(UIImage *)photo forJID:(XMPPJID *)jid
{
    [self.tableView reloadData];
}

@end



















