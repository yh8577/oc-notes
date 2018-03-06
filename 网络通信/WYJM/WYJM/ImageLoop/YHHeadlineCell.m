//
//  YHHeadlineCell.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHeadlineCell.h"
#import "YHHeadline.h"
#import "UIImageView+AFNetworking.h"
@interface YHHeadlineCell ()
    
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
    
@end

@implementation YHHeadlineCell

- (void)setHeadline:(YHHeadline *)headline {
    _headline = headline;
    self.imgsrcView.image = nil;
    self.titleView.text = nil;
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    self.titleView.text = headline.title;
    self.pageControl.currentPage = self.tag;
}
    
    
@end
