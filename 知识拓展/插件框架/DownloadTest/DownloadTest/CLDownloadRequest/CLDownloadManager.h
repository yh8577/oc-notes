//
//  CLDownloadManager.h
//  CLBrowser
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLDownloadRequest;
@interface CLDownloadManager : NSObject
+ (CLDownloadManager *)downloadManagerInstance;
- (CLDownloadRequest *)requestForURL:(NSString *)url;
- (void)startRequestTask:(CLDownloadRequest *)request;
- (void)pauseRequest:(CLDownloadRequest *)request;
- (void)cancelRequest:(CLDownloadRequest *)request;
@end
