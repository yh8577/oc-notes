//
//  Dog.h
//  Person
//
//  Created by jyh on 2018/1/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    //@public
    NSString *_color;
    int _speed;
    NSString *_gender;
    float _weight;
    
}
@property (nonatomic, strong)NSString *color;
@property (nonatomic, assign)int speed;
@property (nonatomic, strong)NSString *gender;
@property (nonatomic, assign)float weight;

- (void)eat;
- (void)call;
- (void)run;

@end
