//
//  NSDate+itcast.m
//  NSDate
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NSDate+itcast.h"

@implementation NSDate (itcast)

- (int)year {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *com = [calender components:NSCalendarUnitYear fromDate:self];
    return (int)com.year;
}

@end
