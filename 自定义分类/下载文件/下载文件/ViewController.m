//
//  ViewController.m
//  下载文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Downloader/YHDownloader.h"

@interface ViewController ()<YHDownloaderDelgate>
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;


@end

@implementation ViewController

- (IBAction)start:(id)sender {
    
    [[YHDownloader sharedDownloader] startDownload:@"http://120.25.226.186:32812/resources/videos/minion_02.mp4"];
//     [[YHDownloader sharedDownloader] startDownload:@"http://127.0.0.1/031-34987-A.dmg"];
    
    
}


- (IBAction)suspended:(id)sender {
    [[YHDownloader sharedDownloader] suspendDownload];
}


- (IBAction)continueto:(id)sender {
    [[YHDownloader sharedDownloader] continuetoDownload];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [YHDownloader sharedDownloader].delegate = self;
    
}

- (void)YHDownloader:(YHDownloader *)YHDownloader progress:(float)progress {
    
    self.progressView.progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.02f",progress * 100];
    
}




@end
