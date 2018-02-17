//
//  ViewController.m
//  QQ聊天界面
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "QQMessageFrame.h"
#import "QQMessage.h"
#import "QQMessageCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *messageFrame;
@end

@implementation ViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollToRowAtIndexPath];
}

- (NSMutableArray *)messageFrame {
    if (!_messageFrame) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"message.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            QQMessage *model = [QQMessage messageWithDict:dict];
            
            QQMessage *lastMdessage = (QQMessage *)[[arrM lastObject] message];
            
            if ([model.time isEqualToString:lastMdessage.time]) {
                model.hideTime = YES;
            }
            QQMessageFrame *modelFrame = [[QQMessageFrame alloc] init];
            modelFrame.message = model;
            [arrM addObject:modelFrame];
        }
        _messageFrame = arrM;
    }
    return _messageFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    
    self.tableView.allowsSelection = NO;
    
    // 监听键盘通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

}

- (void)KeyboardWillChangeFrame:(NSNotification *)notification {
    
//    NSString *strTime = notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]; // 取出键盘弹出时间,可以根据时间做动画.
    
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offSetY = rect.origin.y - self.view.frame.size.height;
 
    self.view.transform =  CGAffineTransformMakeTranslation(0, offSetY);

    [self scrollToRowAtIndexPath];
}


- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}




- (void)sendMessage:(NSString *)text andType:(QQMessageType)type {
    
    QQMessage *message = [[QQMessage alloc] init];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH:mm";
    message.text = text;
    message.time = [formatter stringFromDate:date];
    message.type = type;
    
    QQMessageFrame *messageFrame = [[QQMessageFrame alloc ]init];
    messageFrame.message = message;
    
    QQMessageFrame *lastmessageFrame = self.messageFrame.lastObject;
    NSString *lastTime = lastmessageFrame.message.time;
    
    if ([message.time isEqualToString:lastTime]) {
        message.hideTime = YES;
    }
    
    [self.messageFrame addObject:messageFrame];
    
    [self.tableView reloadData];
    
    [self scrollToRowAtIndexPath];
}


- (void)scrollToRowAtIndexPath {
    
    NSIndexPath *lastIindexPath = [NSIndexPath indexPathForRow:self.messageFrame.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIindexPath atScrollPosition:(UITableViewScrollPositionTop) animated:NO];
}

#pragma mark -- UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self sendMessage:textField.text andType:QQMessageTypeMe];
    
    [UIView animateWithDuration:0.01 delay:0.5 options:(UIViewAnimationOptionCurveLinear) animations:^{
        [self sendMessage:[NSString stringWithFormat:@"你发的[%@]什么鬼,不认识.",textField.text] andType: QQMessageTypeOther];
    } completion:nil];
    
    return YES;
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
        [self.view endEditing:YES];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QQMessageFrame *modelFrame = self.messageFrame[indexPath.row];
    QQMessageCell *cell = [QQMessageCell messageWithTableView:tableView];
    cell.messageaFrame = modelFrame;
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QQMessageFrame *messageaFrame = self.messageFrame[indexPath.row];
    return messageaFrame.rowHeight;
}


@end
