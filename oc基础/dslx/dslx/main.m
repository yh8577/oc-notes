//
//  main.m
//  dslx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Buyer.h"
#import "Seller.h"
#import "Goods.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person personWithName:@"jacck" andAge:18 andHeight:1.88 andGender:male];
        
        NSLog(@"%@",p);
        Buyer *b = [Buyer personWithName:@"guke" andAge:30 andHeight:1.75 andGender:female];
        NSLog(@"%@",b);
        Seller *s = [Seller personWithName:@"奸商" andAge:35 andHeight:160 andGender:male];
        
        Goods *g = [Goods goodsWithSpName:@"yagao" andDj:5.0 andZl:0.5 andImgURL:@"http://www.baodu.com" andProduceDate:(DSDate){2018,1,28} andExpireDate:(DSDate){2020,1,1}];
        s.sp = g;
        
        Seller *s1 = [Seller seller];
        NSLog(@"%@",s1);
        
        
        Person *p1 = [Person person];
        
        p1.age = 18;
        
        
        
    }
    return 0;
}
