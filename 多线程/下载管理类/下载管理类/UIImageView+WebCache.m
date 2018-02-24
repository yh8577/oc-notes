//
//  UIImageView+WebCache.m
//  下载管理类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "YHDownloadoperationManager.h"
#import <objc/runtime.h>
@interface UIImageView ()

@property(nonatomic,copy)NSString *currentUrlString;

@end

@implementation UIImageView (WebCache)

- (NSString *)currentUrlString {
    return objc_getAssociatedObject(self, "currentUrlString");
}

- (void)setCurrentUrlString:(NSString *)currentUrlString {
    
    objc_setAssociatedObject(self, "currentUrlString", currentUrlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setImageUrlString:(NSString *)urlString {
    
    if (![urlString isEqualToString:self.currentUrlString]) {
        [[YHDownloadoperationManager shaerdManager] cancelOperation:self.currentUrlString];
    }
    
    self.currentUrlString = urlString;
    
    [[YHDownloadoperationManager shaerdManager] downloadWithUrlString:urlString finshedBlock:^(UIImage *img) {
        self.image = img;
    }];
    
}

@end
