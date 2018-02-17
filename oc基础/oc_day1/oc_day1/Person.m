//
//  Person.m
//  Person
//
//  Created by jyh on 2018/1/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)call {
    
    NSLog(@"跑步:nsme = %@,体重: %f, 身高:%f",_name,_weight,_height);
    _height += 1;
    _weight -= 0.5;
    NSLog(@"跑完步:nsme = %@,体重: %f, 身高:%f",_name,_weight,_height);
}

- (void)eat {
    NSLog(@"吃,name:%@,体重:%f,身高:%f",_name,_weight,_height);
    _height += 1;
    _weight += 0.5;
    NSLog(@"吃完,name:%@,体重:%f,身高:%f",_name,_weight,_height);
}

- (void)study {
    
    NSLog(@"学习, ios = %d, oc = %d, c = %d",_iosNum, _ocNum, _cNum);
    _cNum += 1;
    _ocNum += 1;
    _iosNum += 1;
    NSLog(@"学习完, ios = %d, oc = %d, c = %d",_iosNum, _ocNum, _cNum);
}

- (void)total{
    NSLog(@"总分:%d",(_iosNum+_ocNum+_cNum));
}


- (void)average {
    NSLog(@"平均分:%d",(_iosNum+_ocNum+_cNum)/3);
}



- (void)callWithPhoneNum:(NSString *)num {

    Phone *p = [[Phone alloc] init];
    
    [p setNumber:num];
    [p call];
}

@end
