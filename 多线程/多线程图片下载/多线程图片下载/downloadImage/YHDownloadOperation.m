//
//  YHDownloadOperation.m
//  Operation下载类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloadOperation.h"
#import "NSString+Sandbox.h"
@implementation YHDownloadOperation

+ (instancetype)downloadOperationWithUrl:(NSString *)url finshedBlock:(void (^)(UIImage *))finshedBlock {
    YHDownloadOperation *op = [[YHDownloadOperation alloc] init];
    op.url = url;
    op.finshedBlock = finshedBlock;
    return op;
}

- (void)main {
    @autoreleasepool {
        NSAssert(self.finshedBlock, @"finshedBlock 不能为空");
        // 获取 url
        NSURL *url = [NSURL URLWithString:self.url];
        // 通过 url 获取 data
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 通过 data 获取 image
        UIImage *image = [UIImage imageWithData:data];
        if (image) {
            // image 不为空保存到沙盒中
            [data writeToFile:[self.url appendCache] atomically:YES];
        }
        // 是否被取消
        if (self.isCancelled) {
            // 如果取消直接退出
            return;
        }
        // 在主线程中
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 回调 image
            self.finshedBlock(image);
        }];

    }
}
@end
