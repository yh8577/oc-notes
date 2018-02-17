//
//  User.h
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface User : NSObject
@property(nonatomic,retain)NSString *nicName;
@property(nonatomic,assign)CZDate birthday;
@property(nonatomic,retain)Account *account;
@end
