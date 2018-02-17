//
//  Dog.m
//  Person
//
//  Created by jyh on 2018/1/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)eat{
    NSLog(@"开吃体重:%f",_weight);
    _weight += 0.5;
    NSLog(@"吃完体重:%f",_weight);
}


- (void)call{
    NSLog(@"颜色:%@,速度:%d,性别:%@,体重:%f",_color,_speed,_gender,_weight);
}

- (void)run{
    NSLog(@"开吃跑:%f",_weight);
    _weight -= 0.5;
    NSLog(@"跑完体重:%f",_weight);
}



@end
