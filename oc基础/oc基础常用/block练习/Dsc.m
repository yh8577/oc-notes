//
//  Dsc.m
//  block练习
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Dsc.h"
#import <string.h>

@implementation Dsc

- (void)sortWithCountries:(char *[])counties andLength:(int)len andCompareBlock:(CompareBlockType)compareBlock; {
    
    for (int i = 0; i < len -1 ; i++) {
        
        //NSLog(@"%s", counties[i]);
        for (int j = 0; j < len - 1 - i; j++) {
            
            
            
            BOOL res = compareBlock(counties[j], counties[j+1]);
           // int res = strcmp(counties[j], counties[j+1]);
            if (res == YES) {
                char *temp = counties[j];
                counties[j] = counties[j+1];
                counties[j+1] = temp;
            }
            
        }
    }
}


- (void)sortWithCountries:(NSMutableArray *)counties andCompareBlock:(CompareBlockType1)compareBlock {
    
    for (int i = 0; i < counties.count - 1 ; i++) {
        
        for (int j = 0; j < counties.count - 1 - i; j++) {
            
            BOOL res = compareBlock(counties[j], counties[j+1]);
            
            //NSLog(@"BOOL = %d",res);
            
            if (res == YES) {
                NSString *temp = counties[j];
                counties[j] = counties[j+1];
                counties[j+1] = temp;
            }
            
            
        }
        
    }
    
}

@end














