//
//  QDView.h
//  手势解锁
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDView : UIView
@property (nonatomic,copy) BOOL (^passwordBlock)(NSString*);
@end
