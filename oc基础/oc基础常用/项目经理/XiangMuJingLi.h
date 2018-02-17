//
//  XiangMuJingLi.h
//  lx
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiangMuJingLi : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)int jiBenGongZhi;
@property(nonatomic,assign)int xiangMuFenHong;
@property(nonatomic,assign)int xiangMuJiangJin;

- (void)call;

@end
