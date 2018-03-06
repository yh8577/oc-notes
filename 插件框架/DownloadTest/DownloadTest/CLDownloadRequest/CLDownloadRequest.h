//
//  CLDownloadRequest.h
//  CLBrowser
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLDownloadDelegate.h"
#import "CLDownloadConfig.h"
#import "CLDownloadManager.h"

typedef enum {
    CLDownloadRequestState_None,                                    //仅仅初始化未做任何操作(既未加入任务队列中)
    CLDownloadRequestState_Wait,                                    //等待下载已加入任务队列但未开始
    CLDownloadRequestState_Loading,                                 //正在下载
    CLDownloadRequestState_Pause,                                   //暂停 已存在任务队列中 属于挂起状态
    CLDownloadRequestState_Cancel,                                  //取消任务
}CLDownloadRequestState;
@interface CLDownloadRequest : NSObject
@property (readonly) NSMutableURLRequest *request;                  //请求对象
@property (assign,nonatomic) CLDownloadRequestState state;          //请求状态
@property (strong,nonatomic) NSString *httpMethod,                  //请求方式 默认GET
*tempPath,                                                          //临时文件目录 暂未使用
*savePath,                                                          //保存文件路径 默认 Document/CLDownload/
*saveFileName;                                                      //保存文件名 默认服务器返回的文件名
@property (nonatomic) NSString *username,                           //用户名 暂未想好怎么用
*password;                                                          //密码   暂未想好怎么用
@property (assign, nonatomic) BOOL allowResume;                     //是否支持断点续传 默认NO
@property (nonatomic) NSURLSessionDownloadTask *task;               //下载任务对象
@property (nonatomic,weak) id <CLDownloadDelegate>delegate;         //代理
@property (assign, nonatomic) float progress;                       //下载进度 范围0.0~1.0
@property (strong, nonatomic,readonly) NSString *url;               //下载文件的远程地址URL
@property (strong, nonatomic,readonly) NSData *resumeData;          //断点续传的Data(包含URL信息)

/**
 * 实例化请求对象 已经存在则返回 不存在则创建一个并返回
 **/
+ (CLDownloadRequest *)initWithURL:(NSString *)url;

/**
 *开始下载任务 适用于首次添加下载任务
 **/
- (void)startDownload;

/**
 * 暂停下载任务 
 * 注意初始化时allowResume 属性为YES 否则无效
 **/
- (void)pauseDownload;

/**
 * 恢复下载任务
 * 注意初始化时allowResume 属性为YES 否则无效
 **/
- (void)resumeDownload;

/**
 * 取消下载任务
 **/
- (void)cancelDownload;

/**
 * 移除断点缓存数据
 * 只有allowResume为yes时 暂停下载 才会有断点缓存数据写入文件
 * 当有新的断点数据时会覆盖 文件区分按照下载URL的MD5值作为文件名
 * 注 外部无需使用 如果 allowResume 为YES 会在文件下载成时自动清除
 **/
- (void)deleteResumeDatat;

@end
