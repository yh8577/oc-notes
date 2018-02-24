//
//  DownloadCell.m
//  多线程图片下载
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "DownloadCell.h"
#import "Download.h"
#import "UIImageView+WebCache.h"
@interface DownloadCell ()
@property(nonatomic,strong)NSOperationQueue *queue;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end
@implementation DownloadCell



- (NSOperationQueue *)queue {
    
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}



- (void)setModel:(Download *)model {
    
    _model = model;

    self.lbl.text = model.name;
    self.imageV.image = [UIImage imageNamed:@"m_3_100"]; // 占位图片;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
}




@end
