//
//  WXChatViewController.m
//  chat聊天界面
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXChatViewController.h"
#import "WXChatModel.h"
#import "WXChatCell.h"

@interface WXChatViewController () <UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *chatData;
@property(nonatomic,strong)NSDictionary *autoReplyData;
@property(nonatomic,copy)NSString *timeStr;
@property (nonatomic,strong)UIActivityIndicatorView *gray;
@end

@implementation WXChatViewController

- (NSMutableArray *)chatData {
    if (!_chatData) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"message.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WXChatModel *chatModel = [WXChatModel chatModelWithDict:obj];
            
            if ([chatModel.time isEqualToString:self.timeStr]) {
                chatModel.time = nil;
            } else {
                self.timeStr = chatModel.time;
            }
            
            [arrM addObject:chatModel];
        }];
        _chatData = arrM;
    }
    return _chatData;
}

- (NSDictionary *)autoReplyData {
    
    if (!_autoReplyData) {
        _autoReplyData = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReply.plist" ofType:nil]];
    }
    
    return _autoReplyData;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 监听键盘通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}


- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)KeyboardWillChangeFrame:(NSNotification *)notification {
    //    NSString *strTime = notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]; // 取出键盘弹出时间,可以根据时间做动画.
    
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offSetY = rect.origin.y - self.view.frame.size.height;
    
    self.view.transform =  CGAffineTransformMakeTranslation(0, offSetY);
  
}

- (NSString *)autoReplyWithText:(NSString *)text {
    for (int i = 0; i < text.length; i++) {
        NSString *str = [text substringWithRange:NSMakeRange(i,1)];
        if (self.autoReplyData[str]) {
            return self.autoReplyData[str];
        }
    }
    return @"你说的是什么啊我听不懂!";
}

- (void)sendMessage:(NSString *)text andType:(messageType)type {
    
    WXChatModel *chatModel = [[WXChatModel alloc] init];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH:mm";
    chatModel.text = text;
    chatModel.time = [formatter stringFromDate:date];
    chatModel.type = type;

    if ([chatModel.time isEqualToString:self.timeStr]) {
        chatModel.time = nil;
    } else {
        self.timeStr = chatModel.time;
    }
    
    [self.chatData addObject:chatModel];
    
    [self.tableView reloadData];

}



- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSIndexPath *lastIindexPath = [NSIndexPath indexPathForRow:self.chatData.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIindexPath atScrollPosition:(UITableViewScrollPositionTop) animated:NO];
}



#pragma mark -- UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self sendMessage:textField.text andType:WXChatModelTypeMe];
    
    [self sendMessage:[self autoReplyWithText:textField.text] andType: WXChatModelTypeOther];
    [UIView animateWithDuration:0.08 delay:0.08 options:(UIViewAnimationOptionCurveLinear) animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
    textField.text = nil;
    return YES;
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WXChatModel *chatModel = self.chatData[indexPath.row];
    
    WXChatCell *cell = [tableView dequeueReusableCellWithIdentifier:chatModel.type == WXChatModelTypeOther ? @"Other" : @"me" forIndexPath:indexPath];
    
    cell.chatModel = chatModel;
    
    return cell;

}


@end
