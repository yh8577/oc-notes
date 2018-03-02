//
//  main.m
//  NSString 截取字符串
//
//  Created by jyh on 2018/3/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *index = @"http://120.25.226.186:32812/resources/videos/minion_02.mp4";
        
        NSLog(@"1=%@",[index lastPathComponent]);
        
        NSLog(@"2=%@",[index stringByDeletingLastPathComponent]);
        
        NSLog(@"3=%@",[index pathExtension]);
        
        NSLog(@"4=%@",[index stringByDeletingPathExtension]);
        
        NSLog(@"5=%@",[index stringByAbbreviatingWithTildeInPath]);
        
        NSLog(@"6=%@",[index stringByExpandingTildeInPath]);
        
        NSLog(@"7=%@",[index stringByStandardizingPath]);
        
        NSLog(@"8=%@",[index stringByResolvingSymlinksInPath]);
        
        NSLog(@"9=%@",[[index lastPathComponent] stringByDeletingPathExtension]);
    }
    return 0;
}
