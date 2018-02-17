//
//  main.m
//  wblx
//
//  Created by jyh on 2018/1/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Microblog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Account *a1 = [[Account new] autorelease];
        a1.userName = @"huihui";
        a1.password = @"123";
        a1.regisDate = (CZDate){2018,11,11};
        
        User *lyh = [[User new] autorelease];
        lyh.nicName = @"xiaoluo";
        lyh.birthday = (CZDate){2000,10,10};
        lyh.account = a1;
        
        Microblog *b1 = [[Microblog new] autorelease];
        
        b1.content = @"jintaaaa";
        b1.imgURL = @"http://www.baidu.com";
        b1.user = lyh;
        b1.zhuanFaBlog = nil;
        
      
        Account *a2 = [[Account new] autorelease];
        a2.userName = @"fzz";
        a2.password = @"123123";
        a2.regisDate = (CZDate){2017,11,11};
        
        User *fzz = [[User new] autorelease];
        fzz.nicName = @"xiaoluo";
        fzz.birthday = (CZDate){2003,5,10};
        fzz.account = a2;
        
        Microblog *b2 = [[Microblog new] autorelease];
        
        b2.content = @"jintaaaa";
        b2.imgURL = @"http://www.baidu.com";
        b2.user = fzz;
        b2.zhuanFaBlog = b1;
        
        

    }
    return 0;
}
