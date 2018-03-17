//
//  YHAudioTools.h
//  音效
//
//  Created by jyh on 2018/3/17.
//  Copyright © 2018年 huig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface YHAudioTools : NSObject
/**
 播放,不带震动
 */
+ (void)playSystemSoundWithURL:(NSURL *)url;
/**
 播放,带震动
 */
+ (void)playAlertSoundWithURL:(NSURL *)url;
/**
 清空音效
 */
+ (void)clearMemory;
@end
