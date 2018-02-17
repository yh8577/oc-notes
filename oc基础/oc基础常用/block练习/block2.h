//
//  block2.h
//  block练习
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface block2 : NSObject
{
    int _arr[10];
}

- (void)bianLiWithBlock:(void (^)(int val))valblock;

@end
