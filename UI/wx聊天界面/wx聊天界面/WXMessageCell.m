//
//  WXMessageCell.m
//  wx聊天界面
//
//  Created by jyh on 2018/2/8.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "WXMessageCell.h"
#import "WXMessageModel.h"
#import "WXMessageFrameModel.h"
@interface WXMessageCell ()
@property (nonatomic,weak)UIButton *text;
@property (nonatomic,weak)UILabel *time;
@property (nonatomic,weak)UIImageView *icon;
@end

@implementation WXMessageCell

+ (instancetype)messageCellWithTableView:(UITableView *)tableView {
    
    static NSString *message_cell_id = @"message_cell_id";
    WXMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:message_cell_id];
    if (!cell) {
        cell = [[WXMessageCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:message_cell_id];
    }
    return cell;
}

- (void)setMessageFrameModel:(WXMessageFrameModel *)messageFrameModel {
    
    _messageFrameModel = messageFrameModel;
    
    WXMessageModel *messageModel = messageFrameModel.messageModel;
    
    self.time.text = messageModel.time;
    self.time.frame = messageFrameModel.timeFrame;
    self.time.hidden = messageModel.hideTime;
    
    NSString *iconStr = messageModel.type == messageTypeOther ? @"m_8_100" : @"m_10_100";
    self.icon.image = [UIImage imageNamed:iconStr];
    self.icon.frame = messageFrameModel.iconFrame;
    
    
    
    [self.text setTitle:messageModel.text forState:(UIControlStateNormal)];
    
    NSString *img,*imgH;
    if (messageModel.type == messageTypeMe) {
        img = @"chat_send_nor";
        imgH = @"chat_send_press_pic";
        [self.text setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    } else if (messageModel.type == messageTypeOther){
        img = @"chat_recive_nor";
        imgH = @"chat_recive_press_pic";
        [self.text setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    
    UIImage *imageNormal = [UIImage imageNamed:img];
    UIImage *imageHighlighted = [UIImage imageNamed:imgH];
    imageNormal = [imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width * 0.5 topCapHeight:imageNormal.size.height * 0.5];
    imageHighlighted = [imageHighlighted stretchableImageWithLeftCapWidth:imageNormal.size.width * 0.5 topCapHeight:imageHighlighted.size.height * 0.5];
    
    [self.text setBackgroundImage:imageNormal forState:(UIControlStateNormal)];
    [self.text setBackgroundImage:imageHighlighted forState:(UIControlStateHighlighted)];
    self.text.frame = messageFrameModel.textFrame;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *text = [[UIButton alloc] init];
        text.titleLabel.font = [UIFont systemFontOfSize:12];
        text.titleLabel.numberOfLines = 0;
        text.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [self.contentView addSubview:text];
        self.text = text;
        
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        self.icon = icon;
        
        UILabel *time = [[UILabel alloc] init];
        time.textAlignment = NSTextAlignmentCenter;
        time.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:time];
        self.time = time;
    }
    self.backgroundColor = [UIColor clearColor];
    
    return self;
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
