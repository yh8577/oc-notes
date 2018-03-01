//
//  YHUploadFiles.h
//  上传多个文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YHUploadFiles : NSObject

+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPath:(NSString *)fieldPath;

+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPath:(NSString *)fieldPath param:(NSString *)param;

+ (void)uploadFiles:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPaths:(NSArray *)fieldPaths params:(NSArray *)params;
@end
