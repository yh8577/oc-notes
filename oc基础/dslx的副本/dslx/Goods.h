//
//  Goods.h
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    
    int year;
    int month;
    int day;
    
}DSDate;

@interface Goods : NSObject
@property(nonatomic,retain)NSString *spName;
@property(nonatomic,assign)float dj;
@property(nonatomic,assign)float zl;
@property(nonatomic,retain)NSString *imgURL;
@property(nonatomic,assign)DSDate produceDate;
@property(nonatomic,assign)DSDate expireDate;

- (instancetype)initWithSpName:(NSString *)spName andDj:(float)dj andZl:(float)zl andImgURL:(NSString *)imgURL andProduceDate:(DSDate)produceDate andExpireDate:(DSDate)expireDate;
+ (instancetype)goods;
+ (instancetype)goodsWithSpName:(NSString *)spName andDj:(float)dj andZl:(float)zl andImgURL:(NSString *)imgURL andProduceDate:(DSDate)produceDate andExpireDate:(DSDate)expireDate;


@end
