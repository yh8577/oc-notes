//
//  QDView.h
//  画板demo
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDView : UIView

@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,strong)UIColor *lineColor;

// 橡皮
- (void)eraser;
// 回退
- (void)back;

// 清屏
- (void)clear;
@end
