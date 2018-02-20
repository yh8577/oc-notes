//
//  main.m
//  获取 json数据
//
//  Created by jyh on 2018/2/20.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        // 这里有获取地址不对的问题
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"];
        
        // 把文件转成 data
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 通过 data 转 NSArray
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"%@",tempArray);
    }
    return 0;
}
