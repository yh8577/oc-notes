//
//  ViewController.m
//  JSON序列化
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 方法1
    // 字符串序列化
//    NSString *jsonStr = @"{\"name\":\"张三\",\"age\":18}";
//     [self postJson:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 方法2
    // 字典序列化
//    NSDictionary *dict = @{@"name":@"李四",@"age":@(18)};
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
//    [self postJson:data];
   
    //方法3
    // 数组序列化
//    NSArray *arr = @[@{@"name":@"张三",@"age":@(18)},
//                     @{@"name":@"李四",@"age":@(19)},
//                     @{@"name":@"王五",@"age":@(20)},
//                     @{@"name":@"赵六",@"age":@(21)}];
//    NSData *data = [NSJSONSerialization dataWithJSONObject:arr options:0 error:nil];
//    [self postJson:data];
    
    // 方法4
    // 自定义模型序列化
//    Person *p = [Person new];
//    p.name = @"辉哥";
//    p.age = @(18);
//    // 利用 kvc 给内部变量赋值
//    [p setValue:@(YES) forKey:@"_isOK"];
//
//    // 判断对象是否可以 json 序列化
////    if (![NSJSONSerialization isValidJSONObject:p]) {
////        return;
////    }
//    NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name",@"age",@"_isOK"]];
//
//    // 不是使用之定义模型对象,必须先把模型转换成字典或者数组.
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
//    [self postJson:data];
    
    // 方法5
    // 自定义模型数组批量序列化
    Person *p = [Person new];
    p.name = @"辉哥";
    p.age = @(18);
    // 利用 kvc 给内部变量赋值
    [p setValue:@(YES) forKey:@"_isOK"];
    
    Person *p1 = [Person new];
    p1.name = @"辉哥1";
    p1.age = @(19);
    // 利用 kvc 给内部变量赋值
    [p1 setValue:@(NO) forKey:@"_isOK"];
    
    NSArray *arr = @[p,p1];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:2];
    for (Person *p in arr) {
        NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name",@"age",@"_isOK"]];
        [arrM addObject:dict];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:arrM options:0 error:nil];
    [self postJson:data];
}

- (void)postJson:(NSData *)data {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/postJson/postjson.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            return;
        }
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        NSLog(@"加载数据");
        
    }] resume];
    
    
}

@end
