//
//  CZFooterView.m
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "CZFooterView.h"

@interface CZFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *loadDataBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *gray;
@property (weak, nonatomic) IBOutlet UIView *grayView;
- (IBAction)loadBtnClick:(id)sender;


@end

@implementation CZFooterView

+ (instancetype)footerView {
    
    CZFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"CZFooterView" owner:nil options:nil] firstObject];
    
    return footerView;
}

- (IBAction)loadBtnClick:(id)sender {
    
    self.loadDataBtn.hidden = YES;
    self.grayView.hidden = NO;

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 调用代理方法;
        // 注意点: 调用代理方法的时候必须先判断一下代理对象是否有实现代理方法.如果实现了,这里才调用.否则不调用.
        if ([self.delegate respondsToSelector:@selector(footerViewUpData:)]) {
             [self.delegate footerViewUpData:self];
        }
        
        self.loadDataBtn.hidden = NO;
        self.grayView.hidden = YES;
    });
    

 
}
@end
