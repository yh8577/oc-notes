//
//  ViewController.m
//  DownloadTest
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import "ViewController.h"
#import "CLDownloadRequest.h"


@interface ViewController ()<CLDownloadDelegate>

@end

static NSString *task1_URL = @"http://dldir1.qq.com/qqfile/qq/QQ8.4/18357/QQ8.4.exe";
static NSString *task2_URL = @"http://dldir1.qq.com/weixin/Windows/WeChatSetup.exe";
static NSString *task3_URL = @"http://dlsw.baidu.com/sw-search-sp/soft/31/12612/AdbeRdr11000_zh_CN11.0.1.210.1459417824.exe";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskLabel.frame = CGRectMake(10, 30, self.view.bounds.size.width-20, 20);
    self.taskProgress.frame = CGRectMake(10, 50, self.view.bounds.size.width-20, 20);
    self.taskButton.frame = CGRectMake(10, 70, 40, 30);
    self.task1Cancel.frame = CGRectMake(self.view.bounds.size.width-50, 70, 40, 20);
    
    self.taskLabel2.frame = CGRectMake(10, 110, self.view.bounds.size.width-20, 20);
    self.taskProgress2.frame = CGRectMake(10, 130, self.view.bounds.size.width-20, 20);
    self.taskButton2.frame = CGRectMake(10, 150, 40, 30);
    self.task2Cancel.frame = CGRectMake(self.view.bounds.size.width-50, 150, 40, 20);


    self.taskLabel3.frame = CGRectMake(10, 190, self.view.bounds.size.width-20, 20);
    self.taskProgress3.frame = CGRectMake(10, 210, self.view.bounds.size.width-20, 20);
    self.taskButton3.frame = CGRectMake(10, 230, 40, 30);
    self.task3Cancel.frame = CGRectMake(self.view.bounds.size.width-50, 230, 40, 20);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)taskButtonAction:(UIButton *)sender {

    sender.selected = !sender.selected;
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task1_URL];
    if (CLDownloadRequestState_None == request.state) {
        request.delegate = self;
        request.httpMethod = @"GET";
        request.allowResume = YES;
        [request startDownload];
        return;
    }
    
    if (!sender.selected) {
        NSLog(@"暂停...");
        [request pauseDownload];
    }else {
        NSLog(@"恢复...");
       [request resumeDownload];
    }
    
}

- (IBAction)taskButton2action:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task2_URL];
    if (CLDownloadRequestState_None == request.state) {
        request.delegate = self;
        request.httpMethod = @"GET";
        request.allowResume = YES;
        [request startDownload];
        return;
    }
    
    if (!sender.selected) {
        NSLog(@"暂停...");
        [request pauseDownload];
    }else {
        NSLog(@"恢复...");
        [request resumeDownload];
    }


}
- (IBAction)taskButton3Action:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task3_URL];
    if (CLDownloadRequestState_None == request.state) {
        request.delegate = self;
        request.httpMethod = @"GET";
        request.allowResume = YES;
        [request startDownload];
        return;
    }
    
    if (!sender.selected) {
        NSLog(@"暂停...");
        [request pauseDownload];
    }else {
        NSLog(@"恢复...");
        [request resumeDownload];
    }

}

- (IBAction)task1CancelAction:(UIButton *)sender {
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task1_URL];
    if (request.state != CLDownloadRequestState_None) {
        [request cancelDownload];
    }

}
- (IBAction)task2CancelAction:(UIButton *)sender {
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task2_URL];
    if (request.state != CLDownloadRequestState_None) {
        [request cancelDownload];
    }

}
- (IBAction)task3CancelAction:(UIButton *)sender {
    CLDownloadRequest *request = [CLDownloadRequest initWithURL:task3_URL];
    if (request.state != CLDownloadRequestState_None) {
        [request cancelDownload];
    }
   
}



#pragma mark- 
#pragma mark - CLDownloadDelegate

- (void)requestDownloadStart:(CLDownloadRequest *)request
{
    if ([request.request.URL.absoluteString isEqualToString:task1_URL]) {
        self.taskButton.selected = YES;
        self.taskLabel.text = @"任务一开始";
    }else if ([request.request.URL.absoluteString isEqualToString:task2_URL]) {
        self.taskButton2.selected = YES;
        self.taskLabel2.text = @"任务二开始";
    }else if ([request.request.URL.absoluteString isEqualToString:task3_URL]) {
        self.taskButton3.selected = YES;
        self.taskLabel3.text = @"任务三开始";
    }

}
- (void)requestDownloading:(CLDownloadRequest *)request
{
    if ([request.request.URL.absoluteString isEqualToString:task1_URL]) {
        self.taskProgress.progress = request.progress;
        self.taskLabel.text = [NSString stringWithFormat:@"任务一: %0.2f%%",request.progress*100];
    }else if ([request.request.URL.absoluteString isEqualToString:task2_URL]) {
        self.taskProgress2.progress = request.progress;
        self.taskLabel2.text = [NSString stringWithFormat:@"任务二: %0.2f%%",request.progress*100];
    }else if ([request.request.URL.absoluteString isEqualToString:task3_URL]) {
        self.taskProgress3.progress = request.progress;
        self.taskLabel3.text = [NSString stringWithFormat:@"任务三: %0.2f%%",request.progress*100];
    }
}
- (void)requestDownloadFinish:(CLDownloadRequest *)request
{
    NSLog(@"download finish fileName: %@",request.saveFileName);
    
    if ([request.request.URL.absoluteString isEqualToString:task1_URL]) {
        self.taskButton.selected = NO;
        self.taskLabel.text = @"任务一完成";
    }else if ([request.request.URL.absoluteString isEqualToString:task2_URL]) {
        self.taskButton2.selected = NO;
        self.taskLabel2.text = @"任务二完成";
    }else if ([request.request.URL.absoluteString isEqualToString:task3_URL]) {
        self.taskButton3.selected = NO;
        self.taskLabel3.text = @"任务三完成";
    }

}
- (void)requestDownloadFaild:(CLDownloadRequest *)request aError:(NSError *)error
{
    NSLog(@"download faild error: %@",error);
    if ([request.url isEqualToString:task1_URL]) {
        self.taskButton.selected = NO;
        self.taskLabel.text = @"任务一失败";
    }else if ([request.url isEqualToString:task2_URL]) {
        self.taskButton2.selected = NO;
        self.taskLabel2.text = @"任务二失败";
    }else if ([request.url isEqualToString:task3_URL]) {
        self.taskButton3.selected = NO;
        self.taskLabel3.text = @"任务三失败";
    }

}
- (void)requestDownloadPause:(CLDownloadRequest *)request
{
    NSLog(@"download Pause fileName: %@",request.saveFileName);
    if ([request.request.URL.absoluteString isEqualToString:task1_URL]) {
        self.taskButton.selected = NO;
        self.taskLabel.text = @"任务一暂停";
    }else if ([request.request.URL.absoluteString isEqualToString:task2_URL]) {
        self.taskButton2.selected = NO;
        self.taskLabel2.text = @"任务二暂停";
    }else if ([request.request.URL.absoluteString isEqualToString:task3_URL]) {
        self.taskButton3.selected = NO;
        self.taskLabel3.text = @"任务三暂停";
    }

}
- (void)requestDownloadCancel:(CLDownloadRequest *)request
{
    NSLog(@"download Cancel fileName: %@",request.saveFileName);
    if ([request.request.URL.absoluteString isEqualToString:task1_URL]) {
        self.taskButton.selected = NO;
        self.taskLabel.text = @"任务一取消";
    }else if ([request.request.URL.absoluteString isEqualToString:task2_URL]) {
        self.taskButton2.selected = NO;
        self.taskLabel2.text = @"任务二取消";
    }else if ([request.request.URL.absoluteString isEqualToString:task3_URL]) {
        self.taskButton3.selected = NO;
        self.taskLabel3.text = @"任务三取消";
    }

}

@end
