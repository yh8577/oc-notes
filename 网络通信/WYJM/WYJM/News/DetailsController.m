//
//  DetailsController.m
//  WYJM
//
//  Created by jyh on 2018/3/7.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "DetailsController.h"
#import "AFHTTPSessionManager.h"
@interface DetailsController ()

@property (nonatomic, strong) UIWebView *webView;
@end

@implementation DetailsController

- (void)loadView {
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.webView;
}

- (void)showWeb {
    
    NSString *urlStr = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/%@/full.html",self.docid];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/javascript", nil];
    [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSDictionary *news = responseObject[rootKey];
        
        __block NSString *title = @"标题";
        __block NSString *time = @"时间";
        __block NSString *body = @"内容";
        
        title = news[@"title"];
        time = news[@"ptime"];
        body = news[@"body"];
        
        NSArray *imgs = news[@"img"];
        [imgs enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *ref = obj[@"ref"];
            NSString *src = obj[@"src"];
            
            NSString *img = [NSString stringWithFormat:@"<img src='%@' width='100%%'>",src];
            
            body = [body stringByReplacingOccurrencesOfString:ref withString:img];
        }];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"web.html" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        html = [html stringByReplacingOccurrencesOfString:@"@title" withString:title];
        html = [html stringByReplacingOccurrencesOfString:@"@time" withString:time];
        html = [html stringByReplacingOccurrencesOfString:@"@body" withString:body];
        
        //baseURL 资源 地址. 比如图片地址
        [self.webView loadHTMLString:html baseURL:nil];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setToolBar];
    
    [self showWeb];
}

- (void)setToolBar {
    
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.frame = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(cancel)];
    toolBar.backgroundColor = [UIColor clearColor];
    toolBar.items = @[item];
    [self.view addSubview:toolBar];
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
