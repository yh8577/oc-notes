//
//  appView.m
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "appView.h"

@interface appView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
- (IBAction)appBtnClick:(UIButton *)sender;


@end

@implementation appView

+ (instancetype)appView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil].firstObject;
    
}

- (void)setModel:(appModel *)model {
    
    _model = model;
    
    self.imageView.image = [UIImage imageNamed:model.img];
    self.title.text = model.title;
    
}

- (IBAction)appBtnClick:(UIButton *)sender {
    
    sender.enabled = NO;
    
    UILabel *labPop = [[UILabel alloc] initWithFrame:CGRectMake((self.superview.frame.size.width - 300) * 0.5, (self.superview.frame.size.height - 30) * 0.5, 300, 30)];
    labPop.backgroundColor = [UIColor blackColor];
    
    labPop.text = @"正在下载.....";
    labPop.textAlignment = NSTextAlignmentCenter;
    labPop.textColor = [UIColor whiteColor];
    labPop.alpha = 0;
    labPop.font = [UIFont boldSystemFontOfSize:15];
    //labPop.clipsToBounds = YES;
    labPop.layer.masksToBounds = YES;
    labPop.layer.cornerRadius = 10;
    
    [UIView animateWithDuration:1.5 animations:^{
        labPop.alpha = 0.5;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.5 delay:1.0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                labPop.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [labPop removeFromSuperview];
                }
            }];
        }
        
    }];
    

    [self.superview addSubview:labPop];
    
    
    

    
}
@end
