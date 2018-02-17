//
//  main.m
//  NSDate
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+itcast.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSDate *date = [NSDate new];
//        NSLog(@"%@",date);
        
//        NSDateFormatter *formatter = [NSDateFormatter new];
//        formatter.dateFormat = @"yyyy 年 MM 月 dd 日 HH:MM:ss";
        /*
         yyyy 年 MM 月 dd 日 HH:mm:ss // 24小时制
         yy 年 MM 月 dd 日 hh:mm:ss / 只显示17年 12小时制
         */
        
//        NSString *strDate = [formatter stringFromDate:date];
//        NSLog(@"%@",strDate);
        
//        NSDate *date1 = [formatter dateFromString:@"2017 年 01 月 28 日 17:01:51"];
//        NSLog(@"%@",date1);
        
        // 获得当前系统时间
//        NSDate *date1 = [NSDate date];
//        NSLog(@"%@",date1);
        // 获得指定时间
//        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:5000];
//        NSLog(@"%@",date);
        
        // 计算两个时间的差
//        NSTimeInterval date3 = [date1 timeIntervalSinceDate:date];
//        NSLog(@"%f",date3);
        
        //NSDate *date = [NSDate date];
        
        // 日期对象,这是一个单例对象
        //NSCalendar *calender = [NSCalendar currentCalendar];
        
        /*
         NSCalendarUnitEra                = kCFCalendarUnitEra,
         NSCalendarUnitYear               = kCFCalendarUnitYear,
         NSCalendarUnitMonth              = kCFCalendarUnitMonth,
         NSCalendarUnitDay                = kCFCalendarUnitDay,
         NSCalendarUnitHour               = kCFCalendarUnitHour,
         NSCalendarUnitMinute             = kCFCalendarUnitMinute,
         NSCalendarUnitSecond             = kCFCalendarUnitSecond,
         NSCalendarUnitWeekday            = kCFCalendarUnitWeekday,
         */
        // 注意点:星期是以星期日开始的所以1代表星期天,7代表星期六
//        NSDateComponents *com = [calender components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
//        NSLog(@"%ld",com.year);
//        NSLog(@"%ld",com.month);
//        NSLog(@"%ld",com.day);
//        NSLog(@"%ld",com.weekday);
        NSDate *date = [NSDate date];
        
        NSLog(@"%d",date.year);
        
        
    }
    return 0;
}
