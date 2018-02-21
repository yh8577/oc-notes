//
//  YHHelp.m
//  网易彩票
//
//  Created by jyh on 2018/2/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHelp.h"

@implementation YHHelp


+ (instancetype)helpWithDict:(NSDictionary *)dict {
    
    YHHelp *help = [[YHHelp alloc] init];
    help.title = dict[@"title"];
    help.html = dict[@"html"];
    help.ID = dict[@"id"];
    
    return help;
}

@end
