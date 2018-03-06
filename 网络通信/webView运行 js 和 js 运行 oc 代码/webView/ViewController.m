//
//  ViewController.m
//  webView
//
//  Created by jyh on 2018/3/6.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

// js 调用 oc
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    <a href="source:///showMessage:/helloworld">调用 oc 方法</a>
    NSLog(@"%@",request.URL.scheme);
    if ([request.URL.scheme isEqualToString:@"source"]) {
        
        NSLog(@"%@",request.URL.pathComponents);
        
        NSString *methodName = request.URL.pathComponents[1];
        NSString *param = request.URL.pathComponents[2];
        
        SEL method = NSSelectorFromString(methodName);
        
        if ([self respondsToSelector:@selector(method:)]) {
            
            [self performSelector:@selector(method:) withObject:param afterDelay:0];
        }
        
        return NO;
    }
    
    return YES;
}

- (void)method:(NSString *)string {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    
    [alert addAction:cancel];
    
    [self showViewController:alert sender:nil];
    
}
// 代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 执行 js 代码
    [webView stringByEvaluatingJavaScriptFromString:@"alert('hello world')"];
}


- (void)loadView {
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    // webview 可以加载视频, pdf,doc
    NSURLRequest *request = [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"login.html" withExtension:nil]];
    // 检测超链接
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
    // 缩放
    self.webView.scalesPageToFit = YES;
                             
 [self.webView loadRequest:request];
    
    
}




@end
