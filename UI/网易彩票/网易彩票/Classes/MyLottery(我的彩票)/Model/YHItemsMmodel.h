//
//  YHItemsMmodel.h
//  网易彩票
//
//  Created by jyh on 2018/2/19.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHItemsMmodel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *accessoryView;
@property(nonatomic,copy)NSString *accessoryContent;
@property(nonatomic,copy)NSString *targetVC;
@property(nonatomic,copy)NSString *plistName;
@property(nonatomic,copy)NSString *cellType;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy)NSString *switchKey;
@property(nonatomic,copy)NSString *funcName;
@property(nonatomic,assign)BOOL isRed;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)itemsWithDict:(NSDictionary *)dict;
@end
