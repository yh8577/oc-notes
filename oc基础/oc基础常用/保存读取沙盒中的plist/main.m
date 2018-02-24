//
//  main.m
//  保存读取沙盒中的plist
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array1 = @[
                            @{@"icon":@"1",@"title":@"麻花脸"},
                            @{@"icon":@"2",@"title":@"落日"},
                            @{@"icon":@"3",@"title":@"动物"},
                            @{@"icon":@"4",@"title":@"瀑布"},
                            @{@"icon":@"5",@"title":@"夜景"}
                            ];
        
        NSString *pathStr =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES).firstObject;
        NSString *path = [NSString stringWithFormat:@"%@/pic1.plist",pathStr];
        [array1 writeToFile:path atomically:NO];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSLog(@"%@",arr);
        
        NSString *strImage = @"http://pic.qiantucdn.com/58pic/13/19/30/68H58PICgNJ_1024.jpg";
        NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
        NSString *fileName = [strImage lastPathComponent];
        
        NSLog(@"%@", [cache stringByAppendingPathComponent:fileName]);
    }
    return 0;
}



















