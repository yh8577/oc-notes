//
//  ViewController1.h
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController1,Tel;
@protocol ViewController1Delegate <NSObject>
@optional
- (void)viewController1:(ViewController1 *)viewController1 WithTel:(Tel *)tel;
@end
@interface ViewController1 : UIViewController
@property (nonatomic, weak) id<ViewController1Delegate> delegate;
@end
