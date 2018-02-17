//
//  main.m
//  NSFileManager
//
//  Created by jyh on 2018/1/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *path = @"/Users/huig/Desktop/321.txt";
        NSError *err;
        
        // 删除文件
        BOOL res = [manager removeItemAtPath:path error:&err];
        NSLog(@"res = %@",res==YES?@"yes":@"no");
        
        //移动,剪切, 文件重命名
//        BOOL res = [manager moveItemAtPath:path toPath:@"/Users/huig/Desktop/321.txt" error:&err];
//        NSLog(@"res = %@",res==YES?@"yes":@"no");
        
        // 拷贝文件
//        BOOL res = [manager copyItemAtPath:path toPath:@"/Users/huig/Desktop/321.txt" error:&err];
//        NSLog(@"res = %@",res==YES?@"yes":@"no");
        
        // 创建文件夹
        // withIntermediateDirectories ,  YES 中间目录不存在也自动创建.
//        BOOL res = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&err];
//        NSLog(@"res = %@",res==YES?@"yes":@"no");
        
        // 创建文件并指定数据
//        NSString *str = @"北京天安门";
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        BOOL res = [manager createFileAtPath:path contents:data attributes:nil];
//        NSLog(@"res = %@",res==YES?@"yes":@"no");
        
        // 拿到子目录,不包括子目录下的目录.
//        NSArray *arr = [manager contentsOfDirectoryAtPath:path error:&err];
//        NSLog(@"%@",arr);
        
//        // 获取指定目录下的所有目录和文件夹的路径
//        NSArray *arr = [manager subpathsAtPath:path];
//        NSLog(@"%@",arr);
        
//        // 判断文件文件夹是否有权限读取
//        BOOL res = [manager isReadableFileAtPath:path];
//        NSLog(@"res = %@", res==YES?@"YES":@"NO");
//
//        // 判断文件文件夹是否可以写入
//        BOOL res1 = [manager isWritableFileAtPath:path];
//        NSLog(@"res1 = %@", res1==YES?@"YES":@"NO");
//
//        // 判断文件文件夹是否可以删除
//        BOOL res2 = [manager  isDeletableFileAtPath:path];
//        NSLog(@"res2 = %@", res2==YES?@"YES":@"NO");
        
        // 获取文件属性
//        NSError *err;
//        NSDictionary *dict = [manager attributesOfItemAtPath:path error:&err];
//
//        NSLog(@"%@",dict);
//        // 取出其中的某一项
//        NSLog(@"%@",dict[NSFileOwnerAccountName]);
        
        /*
         // 判断文件或文件路径是否存在
         // 单例
         NSFileManager *manager = [NSFileManager defaultManager];
         
         NSString *path = @"/Users/huig/Desktop/";
         // 判断文件是否存在
         //BOOL res = [manager fileExistsAtPath:path];
         //NSLog(@"res = %@", res==YES?@"YES":@"NO");
         
         // 判断文件或文件夹是否存在,flog = YES 文件夹, NO 文件.
         BOOL flog = NO;
         BOOL res = [manager fileExistsAtPath:path isDirectory:&flog];
         if (flog) {
         NSLog(@"文件夹");
         }else{
         NSLog(@"res = %@", res==YES?@"YES":@"NO");
         }
         
         */
        
        
    }
    return 0;
}
