//
//  YHShowImageCell.m
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHShowImageCell.h"
#import "YHImageModel.h"
#import "UIImageView+WebCache.h"
@interface YHShowImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation YHShowImageCell

+ (instancetype)imageCellWithTableView:(UITableView *)tableView {
    static NSString *image_cell = @"image_cell";
    YHShowImageCell *cell = [tableView dequeueReusableCellWithIdentifier:image_cell];
    
    return cell;
}

- (void)setModel:(YHImageModel *)model {
    
    _model = model;
    
    self.lbl.text = model.name;
    [self.imageV setImageUrl:model.icon];
    
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
