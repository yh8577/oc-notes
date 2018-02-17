//
//  NannyProtocol.h
//  婴儿
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NannyProtocol <NSObject>
@required
- (void)nurse;
- (void)coaxBabySleep;
@end
