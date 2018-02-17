//
//  WXMessageController.m
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXMessageController.h"
#import "WXMessageModel.h"
#import "WXMessageFrameModel.h"
#import "WXMessageCell.h"
@interface WXMessageController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *messageArray;
@end

@implementation WXMessageController

- (NSMutableArray *)messageArray {
    if (!_messageArray) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"message.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            WXMessageModel *messageM= [WXMessageModel messageModelWithDict:dict];
            WXMessageModel *lastMessage = (WXMessageModel*)[[arrM lastObject] messageModel];
            if ([messageM.time isEqualToString:lastMessage.time]) {
                messageM.hideTime = YES;
            }
            WXMessageFrameModel *messageFrame = [[WXMessageFrameModel alloc] init];
            messageFrame.messageModel = messageM;
            
            [arrM addObject:messageFrame];
        }
        _messageArray = arrM;
    }
    return _messageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    
    // 监听键盘通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollToRowAtIndexPath];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)KeyboardWillChangeFrame:(NSNotification *)notification {
    //    NSString *strTime = notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]; // 取出键盘弹出时间,可以根据时间做动画.
    
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offSetY = rect.origin.y - self.view.frame.size.height;
    
    self.view.transform =  CGAffineTransformMakeTranslation(0, offSetY);
    
    [self scrollToRowAtIndexPath];
}

- (void)sendMessage:(NSString *)text andType:(messageType)type {
    
    WXMessageModel *messageModel = [[WXMessageModel alloc] init];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH:mm";
    messageModel.text = text;
    messageModel.time = [formatter stringFromDate:date];
    messageModel.type = type;
    
    WXMessageFrameModel *messageFrame = [[WXMessageFrameModel alloc ]init];
    messageFrame.messageModel = messageModel;
    
    WXMessageFrameModel *lastmessageFrame = self.messageArray.lastObject;
    NSString *lastTime = lastmessageFrame.messageModel.time;
    
    if ([messageModel.time isEqualToString:lastTime]) {
        messageModel.hideTime = YES;
    }
    
    [self.messageArray addObject:messageFrame];
    
    [self.tableView reloadData];
    
    [self scrollToRowAtIndexPath];
}


- (void)scrollToRowAtIndexPath {
    
    NSIndexPath *lastIindexPath = [NSIndexPath indexPathForRow:self.messageArray.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIindexPath atScrollPosition:(UITableViewScrollPositionTop) animated:NO];
}

#pragma mark -- UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self sendMessage:textField.text andType:messageTypeMe];
    
    [UIView animateWithDuration:0.01 delay:0.5 options:(UIViewAnimationOptionCurveLinear) animations:^{
        [self sendMessage:[NSString stringWithFormat:@"你发的[%@]什么鬼,不认识.",textField.text] andType: messageTypeOther];
    } completion:nil];
    
    return YES;
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WXMessageFrameModel *messageFrame = self.messageArray[indexPath.row];
    return messageFrame.rowHeight;
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio {

    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WXMessageFrameModel *messageFrameModel = self.messageArray[indexPath.row];
    
    WXMessageCell *cell = [WXMessageCell messageCellWithTableView:tableView];
    
    cell.messageFrameModel = messageFrameModel;
    
    return cell;
}

@end
