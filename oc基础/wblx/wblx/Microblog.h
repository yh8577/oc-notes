//
//  Microblog.h
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "User.h"
@interface Microblog : NSObject

@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *imgURL;
@property(nonatomic,assign)CZDate sendTime;
@property(nonatomic,retain)User *user;
@property(nonatomic,retain)Microblog *zhuanFaBlog;



@end
