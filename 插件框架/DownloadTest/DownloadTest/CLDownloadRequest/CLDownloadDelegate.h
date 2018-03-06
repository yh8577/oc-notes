//
//  CLDownloadDelegate.h
//  CLBrowser
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLDownloadRequest;
@protocol CLDownloadDelegate <NSObject>
@optional
- (void)requestDownloadStart:(CLDownloadRequest *)request;
- (void)requestDownloading:(CLDownloadRequest *)request;
- (void)requestDownloadPause:(CLDownloadRequest *)request;
- (void)requestDownloadCancel:(CLDownloadRequest *)request;
- (void)requestDownloadFinish:(CLDownloadRequest *)request;
- (void)requestDownloadFaild:(CLDownloadRequest *)request aError:(NSError *)error;
@end