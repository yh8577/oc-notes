//
//  CZFooterView.h
//  团购
//
//  Created by jyh on 2018/2/4.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZFooterView;
@protocol CZFooterViewDelegate <NSObject>
@required
- (void)footerViewUpData:(CZFooterView *)footerView;

@end

@interface CZFooterView : UIView

@property (nonatomic, weak) id<CZFooterViewDelegate> delegate;

+ (instancetype)footerView;

@end
