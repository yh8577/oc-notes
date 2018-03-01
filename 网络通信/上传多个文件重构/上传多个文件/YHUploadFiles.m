//
//  YHUploadFiles.m
//  上传多个文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHUploadFiles.h"
#define kBoundary @"WebKitFormBoundaryC4ma3A1IuRUsufcc"
@implementation YHUploadFiles

+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPath:(NSString *)fieldPath {
    [self uploadFiles:urlStr fieldName:fieldName fieldPath:fieldPath param:nil];
}

+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPath:(NSString *)fieldPath param:(NSString *)param {
    [self uploadFiles:urlStr fieldName:fieldName fieldPaths:@[fieldPath] params:@[param]];
}

/**
 上传方法
 
 @param urlStr ip 地址
 @param fieldName 上传控件名称
 @param fieldPaths 上传文件的路径
 @param params 而外信息
 */
+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPaths:(NSArray *)fieldPaths params:(NSArray *)params{
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    request.HTTPMethod = @"post";
    
    //Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryC4ma3A1IuRUsufcc
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundary] forHTTPHeaderField:@"Content-Type"];
    
    request.HTTPBody = [self makeBody:fieldName fieldPaths:fieldPaths params:params];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [dict[@"userfile"] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            //NSLog(@"%@: %@",key, obj);
        }];
        
        NSLog(@"%@",dict);
        NSLog(@"加载数据");
        
    }] resume];
}

+ (NSData *)makeBody:(NSString *)fieldName fieldPaths:(NSArray *)fieldPaths params:(NSArray *)params {
    NSMutableData *dataM = [NSMutableData data];
    /*
     ------WebKitFormBoundaryC4ma3A1IuRUsufcc
     Content-Disposition: form-data; name="file[]"; filename="3.jpg"
     Content-Type: image/jpeg
     
     
     ------WebKitFormBoundaryC4ma3A1IuRUsufcc
     Content-Disposition: form-data; name="submit"
     
     
     ------WebKitFormBoundaryC4ma3A1IuRUsufcc--
     */
    [fieldPaths enumerateObjectsUsingBlock:^(NSString *fieldPath, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableString *strM = [NSMutableString string];
        [strM appendFormat:@"\r\n--%@\r\n",kBoundary];
        [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",fieldName,[fieldPath lastPathComponent]];
        [strM appendString:@"Content-Type: application/octet-stream\r\n"];
        [strM appendString:@"\r\n"];
        
        [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSData *data = [NSData dataWithContentsOfFile:fieldPath];
        [dataM appendData:data];
    }];
    
    [params enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSMutableString *strM = [NSMutableString string];
            [strM appendFormat:@"\r\n--%@\r\n",kBoundary];
            [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n",key];
            [strM appendString:@"\r\n"];
            [strM appendFormat:@"%@",obj];
            [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
        }];
    }];
    
    NSString *endStr = [NSString stringWithFormat:@"\r\n--%@--",kBoundary];
    [dataM appendData:[endStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    return dataM.copy;
}

@end
