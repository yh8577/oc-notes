//
//  YHHomeCell.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHomeCell.h"
#import "YHNewsController.h"

@interface YHHomeCell ()
@property (nonatomic, strong) YHNewsController *newsController;
@end

@implementation YHHomeCell

- (void)setUrlString:(NSString *)urlString {
    self.newsController.urlString = urlString;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsController = [sb instantiateInitialViewController];
    
    [self.contentView addSubview:self.newsController.view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.newsController.view.frame = self.bounds;
}

@end
