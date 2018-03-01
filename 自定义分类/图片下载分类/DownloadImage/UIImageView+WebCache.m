//
//  UIImageView+WebCache.m
//  多线程图片下载
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "YHDownloadManager.h"
#import <objc/runtime.h>
@interface UIImageView ()
// 添加一个属性
@property(nonatomic,copy)NSString *currentUrl;
@end

@implementation UIImageView (WebCache)

- (NSString *)currentUrl {
    return objc_getAssociatedObject(self, "currentUrl");
}

- (void)setCurrentUrl:(NSString *)currentUrl {
    objc_setAssociatedObject(self, "currentUrl", currentUrl, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setImageUrl:(NSString *)url {
    
    // 如果 currentUrl 和传入的 url 一直,那么正在下载中.取消下载任务.
    if ([self.currentUrl isEqualToString:url]) {
        [[YHDownloadManager shaerdManager] cancelDownload:url];
    }
    
    // 把新 url 赋值给 currentUrl
    self.currentUrl = url;
    
    // 执行下载任务
    [[YHDownloadManager shaerdManager] downloadWithUrl:url finshedBlock:^(UIImage *image) {
        self.image = image;
    }];
    
}
@end
