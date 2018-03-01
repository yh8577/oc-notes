//
//  YHNetworkTool.m
//  模拟get和post登录
//
//  Created by jyh on 2018/2/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHNetworkTool.h"
#import "NSString+MD5.h"
#import "SSKeychain.h"
#define md5add @"a#&s^dl,."
#define baseUrl @"http://127.0.0.1/md5Login.php"
@implementation YHNetworkTool

+ (instancetype)sharedNetworkTool {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self loadUserInfo];
//        [self postWithSuccess:nil error:nil];
    }
    return self;
}

- (void)getWithSuccess:(void(^)(void))success error:(void(^)(void))error {
    
    NSString *md5Pass = [self lockPwd:self.pwd];
    NSString *strUrl = [NSString stringWithFormat:@"%@?username=%@&password=%@",baseUrl,self.name,md5Pass];
    strUrl = [strUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    [self loginWithRequest:request Success:success error:error];
}

- (void)postWithSuccess:(void(^)(void))success error:(void(^)(void))error {
    
    self.name = [self.name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *md5Pass = [self lockPwd:self.pwd];
    NSURL *url = [NSURL URLWithString:baseUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@",self.name,md5Pass];
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    [self loginWithRequest:request Success:success error:error];
}

- (void)loginWithRequest:(NSURLRequest *)request Success:(void(^)(void))isSuccess error:(void(^)(void))isError {

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            NSLog(@"%zd",httpResponse.statusCode);
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dict);
        NSNumber *userId = dict[@"userId"];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (userId.intValue == 1) {
                NSLog(@"登录成功");
                [self saveUserInfo];
                if (isSuccess) {
                    isSuccess();
                }
            } else {
                if (isError) {
                    isError();
                }
                NSLog(@"登录失败");
            }
        }];
        
    }] resume];
}

- (NSString *)lockPwd:(NSString *)pwd{
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/loadDate.php"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSString *time = dict[@"key"];
    
    NSString *md5Key = [@"1,q.2/a;" md5];
    NSString *hMd5 = [pwd md5:md5Key];
    return [[hMd5 stringByAppendingString:time] md5:md5Key];
    
    /*
     md5Key -> md5加密
     hMd5 = pwd + md5Key -> md5加密
     hMd5 + 服务器时间 + md5Key -> md5加密
     */
}

- (void)saveUserInfo {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    NSString *md5Pass = [self lockPwd:self.pwd];
    [us setObject:self.name forKey:@"user"];
    [us setObject:md5Pass forKey:@"pass"];
    // 密码保存到钥匙串
    [SSKeychain setPassword:self.pwd forService:[NSBundle mainBundle].bundleIdentifier account:self.name];
    [us synchronize];
}

- (void)loadUserInfo {
    
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    self.name = [us valueForKey:@"user"];
    self.pwd = [SSKeychain passwordForService:[NSBundle mainBundle].bundleIdentifier account:self.name];
    self.name = [NSString stringWithFormat:@"%@", [us valueForKey:@"user"]];
    self.pwd = [NSString stringWithFormat:@"%@", [SSKeychain passwordForService:[NSBundle mainBundle].bundleIdentifier account:self.name]];
}
@end
