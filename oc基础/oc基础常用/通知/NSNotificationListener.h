//
//  NSNotificationListener.h
//  通知
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationListener : NSObject
@property(nonatomic,copy)NSString *name;
- (void)m1withNotification:(NSNotification *)notification;
@end
