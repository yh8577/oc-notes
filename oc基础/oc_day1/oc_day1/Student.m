//
//  Student.m
//  Person
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setName:(NSString *)name {

    if ([name length] > 2 || [name  isEqualToString: @"毛哲东"] || [name  isEqualToString: @"习近平"]) {
        _name = @"无名";
        return;
    }
    _name = name;
}

- (NSString *)name {
    
    return _name;
}

- (void)setAge:(int)age {
    
    _age = age >= 0 && age <= 120 ? age : 18;
    
}

- (int)age {
    return  _age;
}

- (void)setChinese:(int)chinese {
    
    _chinese = chinese >= 0 && chinese <= 150 ? chinese : 0;
    
}

- (int)chinese {
    return _chinese;
}

- (void)setMathematics:(int)mathematics {
    
    _mathematics = mathematics >= 0 && mathematics <= 150 ? mathematics : 0;
    
}

- (int)mathematics {
    return _mathematics;
}

- (void)setEnglish:(int)english {
  
    _english = english >= 0 && english <= 150 ? english : 0;
}

- (int)english {
    return _english;
}

- (void)introduce {
    
    int total = _chinese + _english + _mathematics;
    
    int average = total / 3;
    
    NSLog(@"名称: %@, 年龄: %d, 总分: %d, 平均分: %d", _name, _age, total, average);
}




















@end
