//
//  Student.h
//  Person
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    int _age;
    float _chinese;
    float _mathematics;
    float _english;
}

- (void)setName:(NSString *)name;
- (NSString *)name;
- (void)setAge:(int)age;
- (int)age;
- (void)setChinese:(int)chinese;
- (int)chinese;
- (void)setMathematics:(int)mathematics;
- (int)mathematics;
- (void)setEnglish:(int)english;
- (int)english;

- (void)introduce;
@end
