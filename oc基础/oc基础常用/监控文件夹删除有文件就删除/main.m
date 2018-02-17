//
//  main.m
//  监控文件夹删除有文件就删除
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *path = @"/Users/huig/Desktop/123/";
        NSError *err;
        
        while (1) {
            NSArray *arr = [manager subpathsAtPath:path];
            for (NSString *str in arr) {
                NSString *paths = [NSString stringWithFormat:@"%@%@",path,str];
                BOOL res = [manager removeItemAtPath:paths error:&err];
                NSLog(@"删除 = %@",res==YES?@"yes":@"no");
            }
            [NSThread sleepForTimeInterval:3];
        }
    }
    return 0;
}
