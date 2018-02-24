//
//  YHDownloaderOperation.h
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHDownloaderOperation : NSOperation
@property(nonatomic,copy)NSString *urlstring;
@property(nonatomic,copy)void(^finshedBlock)(UIImage *img);
+ (instancetype)downloadOperationWithUrlString:(NSString *)urlString finshedBlock:(void(^)(UIImage *img))finshedBlock;
@end
