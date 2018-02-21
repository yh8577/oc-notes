//
//  YHHelpWebController.m
//  网易彩票
//
//  Created by jyh on 2018/2/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHelpWebController.h"
#import "YHHelp.h"
@interface YHHelpWebController ()<UIWebViewDelegate>

@end

@implementation YHHelpWebController

- (void)loadView {
    
    self.view = [[UIWebView alloc] initWithFrame:kScreenSize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 方法1
//    UIWebView *web = [[UIWebView alloc] init];
//    web.frame = self.view.frame;
//    [self.view addSubview:web];
    
    // 方法2 : 注意点是在 loadView 里面.把 UIWebView 加载到 self.view
    UIWebView *web = (UIWebView*)self.view;
    web.delegate = self;
    // 加载本地网页
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.model.html withExtension:nil];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
    // 注意点:  document.location.href = '#%@'; 这段 js 代码就是跳转指令 把%@是跳转到的标记
    NSString *code = [NSString stringWithFormat:@"document.location.href = '#%@';",self.model.ID];

    [webView stringByEvaluatingJavaScriptFromString:code];
}

@end
