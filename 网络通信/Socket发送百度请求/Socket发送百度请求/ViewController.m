//
//  ViewController.m
//  Socket
//
//  Created by jyh on 2018/2/25.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property(nonatomic,assign)int clientSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (![self connectServer:@"115.239.210.27" post:80]) {
        NSLog(@"连接失败");
        return;
    }
    NSLog(@"连接成功");

    /*
     注意点:每行必须加上\r\n,最后一行必须\r\n\r\n
     NSString *request = @"GET / HTTP/1.1\r\n"
     "Host: www.baidu.com\r\n"
     "Connection: keep-alive\r\n\r\n";
     */
    NSString *request = @"GET / HTTP/1.1\r\n"
    "Host: www.baidu.com\r\n"
    "Connection: close\r\n\r\n";

    NSString *response = [self sendAndRecv:request];

    close(self.clientSocket);
    NSRange range = [response rangeOfString:@"\r\n\r\n"];
    NSString *html = [response substringFromIndex:range.length + range.location];

    [self.webview loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}

// 关闭
- (void)colseBtn {
    close(self.clientSocket);
}

// 连接服务器
- (BOOL)connectServer:(NSString *)ip post:(int)post {

    // 创建 socket
    // 参数1 : domain 协议簇 指定 IPv4
    // 参数2 : type socket 的类型 流 socket 数据包 socket
    // 参数3 : protocol 协议 默认0
    int clientSocket = socket( AF_INET, SOCK_STREAM, IPPROTO_TCP);
    self.clientSocket = clientSocket;
    // 连接服务器
    // 参数1 : socket 的描述符
    // 参数2 : 结构体 ip 地址和端口
    // 参数3 : 结构体的长度 sizeof
    // ip.UTF8String 把 oc 字符串转成 c 字符串
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr(ip.UTF8String);
    addr.sin_port = htons(post);

    int result = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if (result != 0) {
        NSLog(@"失败 = %d",result);
        return NO;
    } else {
        NSLog(@"成功 = %d",result);
        return YES;
    }
}

// 发送
- (NSString *)sendAndRecv:(NSString *)sendMsg {
    const char *msg = sendMsg.UTF8String;
    ssize_t sendCount = send(self.clientSocket, msg, strlen(msg), 0);
    uint8_t buffer[1024];
    ssize_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    NSMutableData *dataM = [NSMutableData dataWithBytes:buffer length:recvCount];

    while (recvCount != 0) {
        recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
        [dataM appendBytes:buffer length:recvCount];
        NSLog(@"===%@",dataM);
    }

    NSString *recvMsg = [[NSString alloc] initWithData:dataM.copy encoding:NSUTF8StringEncoding];

    return recvMsg;
}

@end

