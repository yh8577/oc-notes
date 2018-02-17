//
//  NSNotificationListener.m
//  通知
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NSNotificationListener.h"

@implementation NSNotificationListener
- (void)m1withNotification:(NSNotification *)notification {
    
    NSLog(@"nsme = %@", notification.name);
    NSLog(@"object = %@", notification.object);
    NSLog(@"userInfo = %@", notification.userInfo);
    
    NSDictionary *dict = notification.userInfo;
    
    for (NSString *str in dict) {
        NSLog(@"%@",dict[str]);
    }
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        NSLog(@"key = %@, obj = %@", key,obj);
    }];
}

- (void)dealloc {
    
    NSLog(@"移除通知");
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
@end
