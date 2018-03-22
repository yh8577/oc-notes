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

- (NSMutableArray *)chatArrs {
    if (!_chatArrs) {
        _chatArrs = [NSMutableArray array];
    }
    return _chatArrs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.userJid.full;
    
    [NSFetchedResultsController deleteCacheWithName:@"messages"];
    [self.fetchedResultsController performFetch:nil];
    
    [[YHManagerStream sharedInstance].xmppVCardAvatarModule addDelegate:self delegateQueue:dispatch_get_main_queue()];

    
    NSError *err;
    [self.fetchedResultsController performFetch:&err];
    self.chatArrs = (NSMutableArray *)self.fetchedResultsController.fetchedObjects;

    self.sendMessageTF.delegate = self;
    
    [self.tableView reloadData];
    
    // 键盘通知
    [self registerForKeyboardNotifications];
    
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    // 注意不要用UIKeyboardFrameBeginUserInfoKey，第三方键盘可能会存在高度不准，相差40高度的问题
    CGFloat kbHeight = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    self.view.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - kbHeight);
    
    // 修改滚动天和tableView的contentInset
    //self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kbHeight, 0);
    
    // 跳转到当前点击的输入框所在的cell
    if (self.chatArrs.count > 5) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.chatArrs.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    
    self.view.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    self.tableView.contentInset = UIEdgeInsetsZero;
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
    
    UIImageView *iconView = [cell viewWithTag:1001];
    if (msg.isOutgoing) {
        iconView.image = [UIImage imageWithData:[YHManagerStream sharedInstance].xmppVCardTempModule.myvCardTemp.photo];
    } else {
        iconView.image = [UIImage imageWithData:[[YHManagerStream sharedInstance].xmppVCardAvatarModule photoDataForJID:msg.bareJid]];
    }
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.sendMessageTF endEditing:YES];
}

#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // 发消息
    XMPPMessage *message = [XMPPMessage messageWithType:@"chat" to:self.userJid];
    
    [message addBody:self.sendMessageTF.text];

    [[YHManagerStream sharedInstance].xmppStream sendElement:message];
    
    [self.tableView reloadData];
    
    self.sendMessageTF.text = nil;
    
    return YES;
}

#pragma mark -- XMPPvCardAvatarDelegate

- (void)xmppvCardAvatarModule:(XMPPvCardAvatarModule *)vCardTempModule didReceivePhoto:(UIImage *)photo forJID:(XMPPJID *)jid
{
    [self.tableView reloadData];
}



@end



















