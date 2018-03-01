//
//  NewsCell.m
//  科技头条
//
//  Created by jyh on 2018/2/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"
@interface NewsCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *sitename;
@property (weak, nonatomic) IBOutlet UILabel *addtime;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation NewsCell

- (void)setModel:(NewsModel *)model {
    _model = model;
    self.title.text = model.title;
    self.summary.text = model.summary;
    self.sitename.text = model.sitename;
    self.addtime.text  = model.time;
    [self.imageV setImageUrl:model.img];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    CGFloat titleLength = [self.model.title sizeWithAttributes:@{NSFontAttributeName : self.title.font }].width;
    if (titleLength > self.title.frame.size.width) {
        self.summary.hidden = YES;
    } else {
        self.summary.hidden = NO;
    }
}

+ (instancetype)newsCellWithTableView:(UITableView *)tableView model:(NewsModel *)model {
    
    NSString *cellID = [self cellId:model];
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    return cell;
}

+ (NSString *)cellId:(NewsModel *)model {
    return (model.img.length > 0) ? @"news_cell1" : @"news_cell2";
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
