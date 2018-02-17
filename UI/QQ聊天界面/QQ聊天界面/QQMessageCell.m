//
//  QQMessageCell.m
//  QQ聊天界面
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessageFrame.h"
#import "QQMessage.h"
@interface QQMessageCell ()
@property (nonatomic,weak)UILabel *lblTime;
@property (nonatomic,weak)UIImageView *imgv;
@property (nonatomic,weak)UIButton *btnText;
@end

@implementation QQMessageCell

+ (instancetype)messageWithTableView:(UITableView *)tableView {
    
    static NSString *message_cellId = @"message_cellId";
    
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:message_cellId];
    
    if (!cell) {
        cell = [[QQMessageCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:message_cellId];
    }
    
    return cell;
    
}

- (void)setMessageaFrame:(QQMessageFrame *)messageaFrame {
    
    _messageaFrame = messageaFrame;
    
    QQMessage *model = messageaFrame.message;

    self.lblTime.text = model.time;
    self.lblTime.frame = messageaFrame.timeFrame;
    self.lblTime.hidden = model.hideTime;
    
    NSString *iconImg = model.type == QQMessageTypeMe ? @"m_3_100" : @"m_8_100";
    self.imgv.image = [UIImage imageNamed:iconImg];
    self.imgv.frame = messageaFrame.iconFrame;
    
    [self.btnText setTitle:model.text forState:(UIControlStateNormal)];
    
    NSString *img,*imgH;
    if (model.type == QQMessageTypeMe) {
        img = @"chat_send_nor";
        imgH = @"chat_send_press_pic";
        [self.btnText setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    } else if (model.type == QQMessageTypeOther){
        img = @"chat_recive_nor";
        
        [self.btnText setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    
    UIImage *imageNormal = [UIImage imageNamed:img];
    UIImage *imageHighlighted = [UIImage imageNamed:imgH];
    imageNormal = [imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width * 0.5 topCapHeight:imageNormal.size.height * 0.5];
    imageHighlighted = [imageHighlighted stretchableImageWithLeftCapWidth:imageNormal.size.width * 0.5 topCapHeight:imageHighlighted.size.height * 0.5];
    
    [self.btnText setBackgroundImage:imageNormal forState:(UIControlStateNormal)];
    [self.btnText setBackgroundImage:imageHighlighted forState:(UIControlStateHighlighted)];
    self.btnText.frame = messageaFrame.textFrame;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *lblTime = [[UILabel alloc] init];
        lblTime.font = [UIFont systemFontOfSize:12];
        lblTime.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lblTime];
        self.lblTime = lblTime;

        UIImageView *imgV = [[UIImageView alloc] init];
        [self.contentView addSubview:imgV];
        self.imgv = imgV;
        
        UIButton *btnText = [[UIButton alloc] init];
        btnText.titleLabel.font = [UIFont systemFontOfSize:14];
        btnText.titleLabel.numberOfLines = 0;
        btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [self.contentView addSubview:btnText];

        self.btnText = btnText;
        
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
