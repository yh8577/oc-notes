//
//  AppCell.m
//  通过模板创建 tableView
//
//  Created by jyh on 2018/2/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "AppCell.h"
#import "Apps.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *down;
- (IBAction)downBtnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@end

@implementation AppCell

- (void)setAppsModel:(Apps *)appsModel {
    
    _appsModel = appsModel;
    
    self.imageV.image = [UIImage imageNamed:appsModel.icon];
    self.name.text = appsModel.name;
    
    self.down.text = [NSString stringWithFormat:@"大小:%@/下载:%@", appsModel.size,appsModel.download];
    
    if (appsModel.isDownload) {
        self.downBtn.enabled = NO;
    } else {
        self.downBtn.enabled = YES;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)downBtnClick:(UIButton *)sender {
    self.downBtn.enabled = NO;
    self.appsModel.isDownload = YES;
    
    if ([self.delegate respondsToSelector:@selector(appCellDidClickDownloadbutton:)]) {
        [self.delegate appCellDidClickDownloadbutton:self];
    }
    

    
    
    
}
@end
