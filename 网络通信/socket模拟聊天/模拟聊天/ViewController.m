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
@property (weak, nonatomic) IBOutlet UITextField *ip;
@property (weak, nonatomic) IBOutlet UITextField *dk;
@property (weak, nonatomic) IBOutlet UITextField *sendText;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property(nonatomic,assign)int clientSocket;
@property (weak, nonatomic) IBOutlet UIButton *connectButton;


@end

@implementation ViewController

- (IBAction)connectBtn:(id)sender {
    // 连接服务器
    if ([self connectServer:self.ip.text post:[self.dk.text intValue]]) {
        [self.connectButton setTitle:@"成功连接" forState:(UIControlStateNormal)];
    }
}


- (IBAction)sendBtn:(id)sender {
    self.textLabel.text = [self sendAndRecv:self.sendText.text];
}


- (IBAction)colseBtn:(id)sender {
    
    close(self.clientSocket);
}

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


- (NSString *)sendAndRecv:(NSString *)sendMsg {
    
//    int clientSocket = socket( AF_INET, SOCK_STREAM, IPPROTO_TCP);
    
    const char *msg = sendMsg.UTF8String;
    ssize_t sendCount = send(self.clientSocket, msg, sizeof(msg), 0);
    NSLog(@"发送 = %zd",sendCount);
    
    // 接收服务器返回数据
    uint8_t buffer[1024];
    ssize_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收 = %zd",recvCount);
    
    NSData *data = [NSData dataWithBytes:buffer length:recvCount];
    NSString *recvMsg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到字符 = %@", recvMsg);
    
    return recvMsg;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    // 创建 socket
    // 参数1 : domain 协议簇 指定 IPv4
    // 参数2 : type socket 的类型 流 socket 数据包 socket
    // 参数3 : protocol 协议 默认0
    int clientSocket = socket( AF_INET, SOCK_STREAM, IPPROTO_TCP);
    
    // 连接服务器
    // 参数1 : socket 的描述符
    // 参数2 : 结构体 ip 地址和端口
    // 参数3 : 结构体的长度 sizeof
    
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(12345);
    
    int result = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    
    if (result != 0) {
        NSLog(@"失败 = %d",result);
    }
    NSLog(@"成功 = %d",result);
    
    // 在终端开启服务器端口 nc -lk 12345
    
    // 发送数据
    // 成功返回发送的字符数,失败返回-1
    const char *msg = "hi";
    ssize_t sendCount = send(clientSocket, msg, sizeof(msg), 0);
    NSLog(@"发送 = %zd",sendCount);
    
    // 接收服务器返回数据
    uint8_t buffer[1024];
    ssize_t recvCount = recv(clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收 = %zd",recvCount);
    
    NSData *data = [NSData dataWithBytes:buffer length:recvCount];
    NSString *recvMsg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到字符 = %@", recvMsg);
    // 关闭连接
    close(clientSocket);
     */
}


@end
