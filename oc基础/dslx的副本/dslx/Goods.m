
//
//  Goods.m
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Goods.h"

@implementation Goods

- (void)dealloc {
    
    NSLog(@"goods 销毁");
    [_spName release];
    [_imgURL release];
    [super dealloc];
}

- (instancetype)initWithSpName:(NSString *)spName andDj:(float)dj andZl:(float)zl andImgURL:(NSString *)imgURL andProduceDate:(DSDate)produceDate andExpireDate:(DSDate)expireDate {
    
    if (self = [super init]) {
        
        _spName = spName;
        _dj = dj;
        _zl = zl;
        _imgURL = imgURL;
        _produceDate = produceDate;
        _expireDate = expireDate;
    }
    
    return self;
}

+ (instancetype)goodsWithSpName:(NSString *)spName andDj:(float)dj andZl:(float)zl andImgURL:(NSString *)imgURL andProduceDate:(DSDate)produceDate andExpireDate:(DSDate)expireDate {
    
    return [[[self alloc] initWithSpName:spName andDj:dj andZl:zl andImgURL:imgURL andProduceDate:produceDate andExpireDate:expireDate] autorelease];
}

+ (instancetype)goods {
    
    return [[[self alloc] init] autorelease];
}

@end
