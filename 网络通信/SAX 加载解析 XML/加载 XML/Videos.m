//
//  Videos.m
//  加载 XML
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "Videos.h"

@implementation Videos
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)videosyWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@, {videoId = %@, name = %@, length = %@, videoURL = %@, imageURL = %@,desc = %@ , teacher = %@ }",[super description], self.videoId ,self.name ,self.length, self.videoURL, self.imageURL, self.desc, self.teacher];
}
@end
