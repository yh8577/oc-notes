//
//  WXChatCell.m
//  chat聊天界面
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXChatCell.h"
#import "WXChatModel.h"

@interface WXChatCell ()

@property (weak, nonatomic) IBOutlet UILabel *lbltime;
@property (weak, nonatomic) IBOutlet UILabel *lbltext;

@end
@implementation WXChatCell


- (void)setChatModel:(WXChatModel *)chatModel {
    
    _chatModel = chatModel;
    
    self.lbltime.text = chatModel.time;
    self.lbltext.text = chatModel.text;
 
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
