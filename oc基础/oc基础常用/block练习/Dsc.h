//
//  Dsc.h
//  block练习
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^CompareBlockType)(char *country1,char *country2);
typedef BOOL (^CompareBlockType1)(NSString *country1,NSString *country2);
@interface Dsc : NSObject

- (void)sortWithCountries:(char *[])counties andLength:(int)len andCompareBlock:(CompareBlockType)compareBlock;

- (void)sortWithCountries:(NSMutableArray *)counties andCompareBlock:(CompareBlockType1)compareBlock;

@end
