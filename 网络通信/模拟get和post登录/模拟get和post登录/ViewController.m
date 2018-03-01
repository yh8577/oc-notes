//
//  ViewController.m
//  模拟get和post登录
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MD5.h"

#define md5add @"a#&s^dl,."
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *passLbl;

@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation ViewController



- (IBAction)getLogin:(id)sender {
    NSString *url = @"http://127.0.0.1/md5Login.php";
    
    [self get:self.userField.text pass:self.passField.text urlStr:url];
}

- (IBAction)postLogin:(id)sender {
    NSString *url = @"http://127.0.0.1/md5Login.php";
    [self post:self.userField.text pass:self.passField.text urlStr:url];
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

- (void)post:(NSString *)name pass:(NSString *)pass urlStr:(NSString *)urlStr {
    
    name = [name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSString *md5Pass = [self lockPwd:pass];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@",name,md5Pass];
    
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
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
                self.lbl.text = @"POST 登录成功";
                [self saveUserInfo];
                 [self loadLbl];
            } else {
                NSLog(@"登录失败");
                self.lbl.text = @"POST 登录失败";
            }
        }];

    }] resume];
}

- (void)get:(NSString *)name pass:(NSString *)pass urlStr:(NSString *)urlStr{

    NSString *md5Pass = [self lockPwd:pass];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@?username=%@&password=%@",urlStr,name,md5Pass];
 
    strUrl = [strUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
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
                self.lbl.text = @"GET 登录成功";
                [self saveUserInfo];
                 [self loadLbl];
            } else {
                NSLog(@"登录失败");
                self.lbl.text = @"GET 登录失败";
            }
        }];
        
    }] resume];
}

- (void)saveUserInfo {
    
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    
    NSString *md5Pass = [self lockPwd:self.passField.text];
    [us setObject:self.userField.text forKey:@"user"];
    [us setObject:md5Pass forKey:@"pass"];

    [us synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadLbl];
    
}

- (void)loadLbl {
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    
    self.userField.text = [us valueForKey:@"user"];
//    self.passField.text = [us valueForKey:@"pass"];
    self.nameLbl.text = [NSString stringWithFormat:@"用户名: %@", [us valueForKey:@"user"]];
    self.passLbl.text = [NSString stringWithFormat:@"密码: %@", [us valueForKey:@"pass"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
