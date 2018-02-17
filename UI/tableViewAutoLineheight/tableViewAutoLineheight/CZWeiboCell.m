//
//  CZWeiboCell.m
//  tableViewAutoLineheight
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZWeiboCell.h"
#import "CZWeiboFrameModel.h"
#import "CZWeiboModel.h"
@interface CZWeiboCell ()

@property (weak, nonatomic) UIImageView *iconImgV;
@property (weak, nonatomic) UILabel *name;
@property (weak, nonatomic) UILabel *text;
@property (weak, nonatomic) UIImageView *picImgV;

@end

#define textFont [UIFont systemFontOfSize:14]

@implementation CZWeiboCell


+ (instancetype)weiboCellWithTableView:(UITableView *)tableView {
    
    static NSString *weiboCell_id = @"weiboCell_id";
    CZWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:weiboCell_id];
    if (!cell) {
        cell = [[CZWeiboCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:weiboCell_id];
    }
    return cell;
}

- (void)setModelFrame:(CZWeiboFrameModel *)modelFrame {
    
    _modelFrame = modelFrame;
    
    [self settingData];
    
    [self settingFrame];
    
}

- (void)settingData {
    
    CZWeiboModel *model = self.modelFrame.weibo;
    
    self.iconImgV.image = [UIImage imageNamed:model.icon];
    self.name.text = model.name;
    self.text.text = model.comments;
    if (model.pic) {
        self.picImgV.image = [UIImage imageNamed:model.pic];
        self.picImgV.hidden = NO;
    } else {
        self.picImgV.hidden = YES;
    }
}

- (void)settingFrame {
 
    self.iconImgV.frame = self.modelFrame.iconFrame;
    
    self.name.frame = self.modelFrame.nameFrame;

    self.text.frame = self.modelFrame.textFrame;
    
    self.picImgV.frame = self.modelFrame.picFrame;
    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        self.iconImgV = icon;
        
        UILabel *name = [[UILabel alloc] init];
        name.font = textFont;
        [self.contentView addSubview:name];
        self.name = name;

        UILabel *text = [[UILabel alloc] init];
        text.font = textFont;
        text.numberOfLines = 0;
        text.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:text];
        self.text = text;

        UIImageView *picImgV = [[UIImageView alloc] init];
        [self.contentView addSubview:picImgV];
        self.picImgV = picImgV;
        
    }
    
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
