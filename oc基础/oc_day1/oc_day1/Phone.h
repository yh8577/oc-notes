//
//  Phone.h
//  oc_day1
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
{
    NSString *_number;
}

@property (nonatomic, strong) NSString *number;



- (void)call;
@end
