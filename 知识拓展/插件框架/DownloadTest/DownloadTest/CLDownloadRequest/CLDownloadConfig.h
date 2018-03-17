//
//  ClDownloadConfig.h
//  DownloadTest
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//


#ifndef __OPTIMIZE__
#define CLog(...) NSLog(__VA_ARGS__)
#else
#define CLog(...) {}
#endif

#warning 下载任务并发数...如需要请修改
#define maxConcurrentTaskCount 2 //下载队列并发数
