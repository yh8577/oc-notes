//
//  YHNewsCell.m
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNewsCell.h"
#import "YHNews.h"
#import "UIImageView+AFNetworking.h"
@interface YHNewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextraViews;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UILabel *replyCountView;

@end
@implementation YHNewsCell

+ (NSString *)getRuseId:(YHNews *)news {
    if (news.imgType) {
        return @"news_cell1";
    } else if (news.imgextra) {
        return @"news_cell2";
    }
    return @"news_cell";
}

+ (CGFloat)getRowheigth:(YHNews *)news {
    if (news.imgType) {
        return 200;
    } else if (news.imgextra) {
        return 150;
    }
    return 100;
}

- (void)setNews:(YHNews *)news {
    _news = news;
             
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCountView.text = [NSString stringWithFormat:@"%@人回帖",news.replyCount];
    
    [news.imgextra enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *imgsrc = obj[@"imgsrc"];
        UIImageView *imageView = self.imgextraViews[idx];
        [imageView setImageWithURL:[NSURL URLWithString:imgsrc]];
    }];
}

@end
