//
//  YHNews.h
//  WYJM
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL imgType;
@property (nonatomic, copy) NSArray *imgextra;
@property (nonatomic, copy) NSString *docid;
+ (instancetype)newsListWithDic:(NSDictionary *)dic;
+ (void)newsListWithURLString:(NSString *)urlString successBlock:(void(^)(NSArray *))SuccessBlock errorBlock:(void(^)(void))errorBlock;
@end
