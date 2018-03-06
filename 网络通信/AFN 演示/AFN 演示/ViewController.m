//
//  ViewController.m
//  AFN 演示
//
//  Created by jyh on 2018/3/5.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//http://127.0.0.1/login/newLogin.php
    [self getXML];
}

- (void)getXML {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 修改返回数据类型
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager GET: @"http://127.0.0.1/data/videos.xml" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSXMLParser *responseObject) {

        NSLog(@"%@",responseObject);
        responseObject.delegate = self;
        [responseObject parse];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

// NSXMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"开始节点 %@, %@",elementName, attributeDict);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"节点之间的内容 %@",string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"结束节点 %@",elementName);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"结束");
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"%@",parseError);
}

- (void)getBaidu {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 修改返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET: @"https://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]) ;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)download {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/031-34987-A.dmg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[[AFHTTPSessionManager manager] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"totalUnitCount = %zd",downloadProgress.totalUnitCount);
        NSLog(@"fileTotalCount = %zd",downloadProgress.fileTotalCount);
         NSLog(@"completedUnitCount = %zd",downloadProgress.completedUnitCount);
        NSLog(@"localizedDescription = %@",downloadProgress.localizedDescription);
        NSLog(@"localizedAdditionalDescription = %@",downloadProgress.localizedAdditionalDescription);
        NSLog(@"%@",[NSThread currentThread]);
        // 注意点这里要返回主线程更新 ui
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 注意点:这里要给定一个保存文件的路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:response.suggestedFilename];
        NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
        return url;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@",filePath);
    }]resume];
}

- (void)post2 {
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"1.jpg" withExtension:nil];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"2.jpg" withExtension:nil];
    [[AFHTTPSessionManager manager] POST:@"http://127.0.0.1/upload/upload-m.php" parameters:@{@"username[]":@"zhangsan"} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileURL:url1 name:@"file[]" error:nil];
        [formData appendPartWithFileURL:url2 name:@"file[]" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----------------%@,%@",task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
    }];
    
}

- (void)post1 {
    [[AFHTTPSessionManager manager] POST:@"http://127.0.0.1/login/newLogin.php" parameters:@{@"username":@"123",@"password":@"321"} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

- (void)get2 {
    
    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1/login/newLogin.php" parameters:@{@"username":@"123",@"password":@"321"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)get1 {
    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1/data/data.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@,%@",task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@,%@",task,error);
    }];
}

@end
