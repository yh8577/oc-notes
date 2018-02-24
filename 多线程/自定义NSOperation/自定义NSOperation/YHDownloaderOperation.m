//
//  YHDownloaderOperation.m
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHDownloaderOperation.h"
#import "NSString+Sandbox.h"
@implementation YHDownloaderOperation

+ (instancetype)downloadOperationWithUrlString:(NSString *)urlString finshedBlock:(void (^)(UIImage *))finshedBlock {
    YHDownloaderOperation *op = [[YHDownloaderOperation alloc] init];
    op.urlstring = urlString;
    op.finshedBlock = finshedBlock;
    
    return op;
}

- (void)main {
    @autoreleasepool {
        
        NSAssert(self.finshedBlock != nil, @"finshedBlock 不能为空");
        
        NSURL *url = [NSURL URLWithString:self.urlstring];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if (data) {
            [data writeToFile:[self.urlstring appendCache] atomically:YES];
        }
        
        [NSThread sleepForTimeInterval:2.0];
        
        // 判断是否被取消
        if (self.isCancelled) {
            return;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIImage *img = [UIImage imageWithData:data];
            self.finshedBlock(img);
        }];
   
    }

}
@end
