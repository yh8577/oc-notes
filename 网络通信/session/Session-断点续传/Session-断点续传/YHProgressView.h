//
//  YHProgressView.h
//  下载文件
//
//  Created by jyh on 2018/3/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHProgressView : UIButton
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) float fontOfSize;
@property (nonatomic, copy) NSString *title;
@end
