//
//  YHDownloadManager.h
//  自定义多线程图片下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHDownloadManager : NSOperation
// 单例
+ (instancetype)shaerdManager;
// 下载方法
- (void)downloadWithUrl:(NSString *)url finshedBlock:(void(^)(UIImage *image))finshedBlock;
// 取消方法
- (void)cancelDownload:(NSString *)url;
@end
