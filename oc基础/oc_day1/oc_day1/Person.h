//
//  Person.h
//  Person
//
//  Created by jyh on 2018/1/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"
@interface Person : NSObject

{
    @public
    NSString *_name;
    int _age;
    float _height;
    float _weight;
    int _cNum;
    int _ocNum;
    int _iosNum;
    Phone *_phone;
    NSString *_num;
    
}

@property (nonatomic, strong) NSString *num;
@property (nonatomic, copy) Phone *phone;

- (void)call;
- (void)eat;
- (void)study;
- (void)total;
- (void)average;



- (void)callWithPhoneNum:(NSString *)num;

@end
