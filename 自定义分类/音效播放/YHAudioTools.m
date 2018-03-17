 //
//  YHAudioTools.m
//  音效
//
//  Created by jyh on 2018/3/17.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHAudioTools.h"

static NSMutableDictionary *_soundIDDict;

@implementation YHAudioTools

+ (void)initialize {
    _soundIDDict = [NSMutableDictionary dictionaryWithCapacity:3];
}

+ (SystemSoundID)loadSoundWithURL:(NSURL *)url {
    SystemSoundID soundID = [_soundIDDict[url.absoluteString] intValue];
    if (soundID == 0) {
        AudioServicesCreateSystemSoundID(CFBridgingRetain(url), &soundID);
        _soundIDDict[url.absoluteString] = @(soundID);
    }
    return soundID;
}
/**
 播放,不带震动
 */
+ (void)playSystemSoundWithURL:(NSURL *)url {
     AudioServicesPlaySystemSound([self loadSoundWithURL:url]);
}
/**
 播放,带震动
 */
+ (void)playAlertSoundWithURL:(NSURL *)url {
    AudioServicesPlayAlertSound([self loadSoundWithURL:url]);
}
/**
 清空音效
 */
+ (void)clearMemory {
    [_soundIDDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        SystemSoundID soundID = [obj intValue];
        AudioServicesDisposeSystemSoundID(soundID);
    }];
}

/*
 // 清空局部音效在当前控制器对的 - (void)didReceiveMemoryWarning 方法中
// 清空全局音效 在 application 调用
 - (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
 
 // 清空全局音效
 NSLog(@"清空全局音效");
 [YHAudioTools clearMemory];
 }
 */
@end
