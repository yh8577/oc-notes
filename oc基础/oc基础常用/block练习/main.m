//
//  main.m
//  block练习
//
//  Created by jyh on 2018/1/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dsc.h"
#import "block2.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        block2 *b1 = [[block2 alloc] init];
        
        [b1 bianLiWithBlock:^(int val) {
            
            NSLog(@"%d",val + 1);
            
        }];
        
        
        
        
        
        
//        Dsc *d1 = [[Dsc alloc] init];
//        
//        char *countries[] = {
//            "asadas","sdsf","ewqteryut","fbbvcjf","b","mh"
//        };
//        
//    
//        [d1 sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:^BOOL(char *country1, char *country2) {
//            int res =  (int)strlen(country1) - (int)strlen(country2);
//            if (res > 0) {
//                return YES;
//            }
//            
//            return NO;
//            
//        }];
//        
//        [d1 sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:^BOOL(char *country1, char *country2) {
//            
//            int res = strcmp(country1, country2);
//            return res > 0;
//            
//        }];
//        
//        for (int i = 0; i < sizeof(countries)/8; i++) {
//            NSLog(@"= %s",countries[i]);
//        }
//        
//        
//        NSMutableArray *arrayM = [[NSMutableArray alloc] initWithObjects:@"asadas",@"sdsf",@"ewqteryut",@"fbbvcjf",@"b",@"mh", nil];
//        
//        [d1 sortWithCountries:arrayM andCompareBlock:^BOOL(NSString *country1, NSString *country2) {
//           
//            int res =  (int)country1.length - (int)country2.length;
//            
//            if (res > 0) {
//                return YES;
//            }
//            
//            return NO;
//            
//        }];
//        
//        [d1 sortWithCountries:arrayM andCompareBlock:^BOOL(NSString *country1, NSString *country2) {
//            
//            NSInteger res = [country1 compare:country2];
//            
//            return res;
//            
//        }];
//        
//        
//        for (int i = 0; i < arrayM.count; i++) {
//            NSLog(@"%@",arrayM[i]);
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}

















