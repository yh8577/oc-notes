//
//  main.m
//  字符串处理NSString
//
//  Created by jyh on 2018/1/28.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NNLog(val); NSLog(@"%@",val);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 对存储在堆区,mrc 模式下引用计数器默认是1
//        NSString *str = [NSString stringWithFormat:@"jack"];
        
        // 存储在常量区,mrc 引用计数器是无限大.因为不应许被释放
       // NSString *str = @"jack";
//        NSLog(@"%lu",str.retainCount);
        
        // NSObject 两个对象方法 copy 和 mutableCopy
        // copy 对 NSString 的拷贝,是浅拷贝.只是指针地址的拷贝.潜拷贝会对引用计数器加 1
        // copy 对 NSMutableString 是深拷贝,会创建一个新对象. 深拷贝对原来的对象引用计数器不会加 1 . 新对象引用计数器也是 1
        // mutableCopy 对 NSString 和 NSMutableString 都是深拷贝,都会创建一个新的对象.
        // 这是 copy 和 NSMutableString ,对字符串的特点.
//        NSString *str1 = @"jack";
//
//        NSMutableString *str2 = [str1 mutableCopy];
//        [str2 appendString:@"aaaaa"];
//        NSLog(@"%@",str1);
//        NSLog(@"%@",str2);
        
        
        
        // 字符串截取
//        NSString *str = @"Hello, World!";
//
//        NSString *str1 = [str substringWithRange:NSMakeRange(3, 4)];
//        NNLog(str1);
//
//
//
//        NSString *str2 = [str substringFromIndex:3];
//        NNLog(str2);
//
//        NSString *str3 = [str substringToIndex:3];
//        NNLog(str3);
//
//        // 字符串替换
//        NSString *str4 = @"我爱北京天安门";
//        str4 = [str4 stringByReplacingOccurrencesOfString:@"北京天安门" withString:@"12345"];
        
        // 字符串的类型转换
        /*
         @property (readonly) double doubleValue;
         @property (readonly) float floatValue;
         @property (readonly) int intValue;
         @property (readonly) NSInteger integerValue
         @property (readonly) long long longLongValue
         @property (readonly) BOOL boolValue
         */
        // 注意点:从头开始转换到不能转换的地方就会停止
//        NSString *str5 = @"12hhhh";
//        double d = str5.doubleValue;
//        NSLog(@"%f",d);
//
        // 字符串的其他常用方法
//        NSString *str6 = @"  Hello, World!  ";
//        // [NSCharacterSet whitespaceCharacterSet] , NSCharacterSet 还有很多其他方法,详见文档
//        // 去掉前后空格
//        str6 = [str6 stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
//        NSLog(@"%@",str6);
//
//        // 转换大写
//        str6 = [str6 uppercaseString];
//        NSLog(@"%@",str6);
//
//        // 转换小写
//        str6 = [str6 lowercaseString];
//        NSLog(@"%@",str6);
        
        //NSError *err;
        
        // 写入文件
        //NSString *path = @"/Users/huig/Desktop/123.txt";
        //NSString *str = @"辉哥哥哥哥哥哥";
        //BOOL res = [str writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&err];
        //res == YES ? NSLog(@"yes") : NSLog(@"no , err = %@", err.localizedDescription);
        
        // 读取文件
        //NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
        //err == nil ? NSLog(@"yes, str = %@", str) : NSLog(@"no , err = %@", err.localizedDescription);
        
        // 读取网络地址
        //NSURL *url = [NSURL URLWithString:@"http://192.168.31.1/cgi-bin/luci/;stok=709fe43b1015cf562db56ddffb724469/web/setting/wan"];
        //NSString *str =  [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
        //err == nil ? NSLog(@"yes, str = %@", str) : NSLog(@"no , err = %@", err.localizedDescription);
        
        
        // 通过 url 写入文件
        //NSString *str = @"辉哥哥辉哥哥辉哥哥辉哥哥辉哥哥辉哥哥辉哥哥哥哥哥哥";
        //NSURL *url = [NSURL URLWithString:@"file:///Users/huig/Desktop/123.txt"];
        //BOOL res = [str writeToURL:url atomically:NO encoding:NSUTF8StringEncoding error:&err];
        //res == YES ? NSLog(@"yes") : NSLog(@"no , err = %@", err.localizedDescription);
        
        
        // 字符串比较,不忽略大小写
        //        NSString *str1 = @"jack";
        //        NSString *str2 = @"JACK";
        //
        //        NSComparisonResult res = [str1 compare:str2];
        
        //        switch (res) {
        //            case NSOrderedAscending:
        //                NSLog(@"str1 比 str2 小");
        //                break;
        //            case NSOrderedSame:
        //                NSLog(@"一样");
        //                break;
        //            case NSOrderedDescending:
        //                NSLog(@"str1 比 str2 大");
        //                break;
        //        }
        // 枚举值一般 以数值代替
        //        switch (res) {
        //            case -1:
        //                NSLog(@"str1 比 str2 小");
        //                break;
        //            case 0:
        //                NSLog(@"一样");
        //                break;
        //            case 1:
        //                NSLog(@"str1 比 str2 大");
        //                break;
        //        }
        
        // 字符串写比较,忽略大小
        //        NSString *str1 = @"jack";
        //        NSString *str2 = @"JACK";
        //        NSCaseInsensitiveSearch = 1 等同;
        //        NSComparisonResult res = [str1 compare:str2 options:1];
        //
        //        switch (res) {
        //            case -1:
        //                NSLog(@"str1 比 str2 小");
        //                break;
        //            case 0:
        //                NSLog(@"一样");
        //                break;
        //            case 1:
        //                NSLog(@"str1 比 str2 大");
        //                break;
        //        }
        
        // 比较字符串中数字,但是格式必须是固定的.
        //        NSString *img1 = @"pic1010,jpg";
        //        NSString *img2 = @"pic1020,jpg";
        
        //        NSNumericSearch = 64 等同
        //        NSComparisonResult res = [img1 compare:img2 options:64];
        //
        //        switch (res) {
        //            case -1:
        //                NSLog(@"小");
        //                break;
        //            case 0:
        //                NSLog(@"一样");
        //                break;
        //            case 1:
        //                NSLog(@"大");
        //                break;
        //        }
        
        // 判断开头是不是指定字符串
        //        NSString *str = @"http://www.baidu.com";
        
        //        BOOL res = [str hasPrefix:@"http://"];
        //
        //        logBOOL(res);
        
        // 判断结尾是不是指定字符串
        //        BOOL res = [str hasSuffix:@".com"];
        //        logBOOL(res);
        
        // 在主串中搜索子串出现的范围.(在主字符串中搜索指定字符串在当中的范围)
        // 如果没有找到range.length值9223372036854775807,range.length = 0
        // 判断有没有找到可以判断range.length的值,也就是长度是否0.如果是就是没有找到
        // 注意:这个方法是从前往后搜索,找到的是第一次匹配的字符串
        // 从前往后搜索
        //        NSString *str = @"i love me!";
        //        NSRange range = [str rangeOfString:@"lover"];
        //
        //        NSLog(@"%@",NSStringFromRange(range));
        
        // 从后往前搜索
        //        NSString *str = @"i love me! love";
        //        NSBackwardsSearch = 4;
        //        NSRange range = [str rangeOfString:@"love" options:4];
        //
        //        NSLog(@"%@",NSStringFromRange(range));
        
        
        
        //NSMutableString //只在进行大量字符串拼接时使用
        
    }
    return 0;
}
