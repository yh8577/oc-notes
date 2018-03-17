//
//  ViewController.m
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHDownloaderManager.h"
#import "YHProgressView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet YHProgressView *progressView;


@end

@implementation ViewController

- (IBAction)start:(id)sender {
    
//    [YHDownloader sharedDownloader].delegate = self;
//    @"http://127.0.0.1/031-34987-A.dmg"
//    @"http://120.25.226.186:32812/resources/videos/minion_02.mp4"
    [[YHDownloaderManager sharedManager] startDownload:@"http://120.25.226.186:32812/resources/videos/minion_02.mp4" successBlock:^(BOOL isSuccess) {
        NSLog(@"下载完成");
    } progressBlock:^(float progress) {
        self.progressView.progress = progress;
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}



- (IBAction)cancel:(id)sender {
    [[YHDownloaderManager sharedManager] suspendDownload:@"http://127.0.0.1/031-34987-A.dmg"];
    NSLog(@"暂停");
}

- (IBAction)delete:(id)sender {
    [[YHDownloaderManager sharedManager] removeFileForKey:@"http://127.0.0.1/031-34987-A.dmg"];
    NSLog(@"删除");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

//- (void)YHDownloader:(YHDownloader *)YHDownloader progress:(float)progress {
//
//    self.progressView.progress = progress;
//    self.progressLabel.text = [NSString stringWithFormat:@"%.02f",progress * 100];
//
//}




@end
