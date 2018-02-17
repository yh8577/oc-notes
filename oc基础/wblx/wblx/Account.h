//
//  Account.h
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    int year;
    int month;
    int day;
} CZDate;

@interface Account : NSObject


@property(nonatomic,retain)NSString *userName;
@property(nonatomic,retain)NSString *password;
@property(nonatomic,assign)CZDate regisDate;

@end
