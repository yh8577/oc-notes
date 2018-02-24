//
//  YHDownloadoperationManager.h
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHDownloadoperationManager : NSObject
+ (instancetype)shaerdManager;
- (instancetype)downloadWithUrlString:(NSString *)urlString finshedBlock:(void(^)(UIImage *img))finshedBlock;
@end
