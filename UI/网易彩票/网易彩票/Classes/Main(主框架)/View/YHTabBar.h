//
//  YHTabBar.h
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHTabBar : UIView
@property (nonatomic,copy)void(^tabBarButonBlock)(NSInteger);
- (void)addButtonWithImageName:(NSString *)imageName;

@end
