//
//  main.m
//  通知
//
//  Created by jyh on 2018/2/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNotificationSender.h"
#import "NSNotificationListener.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        // 发布者
        NSNotificationSender *sender1 = [[NSNotificationSender alloc] init];
        
        // 监听者
        NSNotificationListener *listener1 = [[NSNotificationListener alloc] init];
    
        // 通知对象
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        
        // 监听通知
        /*
         addObserver : 监听通知的对象
         selector : 监听到通知要执行的方法
         name : 这条通知的名称
         object : 通知的发送者
         
         注意点:
         name:nil object:sender1  ==  sender1 发出的所有通知都会监听到
         name:@"mmm1" object:nil == 不管谁发的通知,只有通知名称是 @"mmm1" 都会监听到
         name:nil object:nil == 不管谁发通知,不管通知名称是什么.都会监听到.
         
         */
        [notificationCenter addObserver:listener1 selector:@selector(m1withNotification:) name:@"mmm1" object:sender1];
        //        [notificationCenter addObserverForName:(nullable NSNotificationName) object:(nullable id) queue:(nullable NSOperationQueue *) usingBlock:^(NSNotification * _Nonnull note) {
        
//        }]


        // 发送通知
        /*
         postNotificationName : 这条通知的名称
         object : 通知的发送者
         userInfo : 通知的参数
         
         */
        [notificationCenter postNotificationName:@"mmm1" object:sender1 userInfo:@{@"title":@"今日头条",@"text":@"成龙.........头发少了"}];
    
        // 注意点: 监听通知必须在发布之前.
    
    
        
    
    }
    return 0;
}
