//
//  CZTuanGouCell.m
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZTuanGouCell.h"
@interface CZTuanGouCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end



@implementation CZTuanGouCell

+ (instancetype)tuangouCellWithTableView:(UITableView *)tableView {
    
    static NSString *cellID = @"cellID";
    
    CZTuanGouCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CZTuanGouCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setTuangouModel:(CZTuanGou *)tuangouModel {
    
    _tuangouModel = tuangouModel;
    
    self.imageView.image = [UIImage imageNamed:tuangouModel.icon];
    self.name.text = tuangouModel.name;
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
