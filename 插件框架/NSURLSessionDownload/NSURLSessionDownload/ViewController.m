#import "ViewController.h"
#import "RainbowProgress.h"
#define MP4_URLString @"http://127.0.0.1/aa.dmg"
@interface ViewController () <NSURLSessionDownloadDelegate>
/** 彩虹进度条 */
@property (nonatomic,weak)RainbowProgress *progress;
@end

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    RainbowProgress* progress = [[RainbowProgress alloc] init];
    [progress startAnimating];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:progress];
    self.progress = progress;
    [self download];
}
-(void)download{
    // 创建会话
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration
            defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    // 确定URL
    NSURL* url = [NSURL URLWithString:MP4_URLString];
    // 通过会话在确定的URL上创建下载任务
    NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithURL:url];
    // 启动任务
    [downloadTask resume];
}
#pragma mark - NSURLSessionDataDelegate Function
// 下载了数据的过程中会调用的代理方法
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten
    totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"%lf",1.0 * totalBytesWritten / totalBytesExpectedToWrite);
    self.progress.progressValue = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
}
// 重新恢复下载的代理方法
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
    didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
}
// 写入数据到本地的时候会调用的方法
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
    didFinishDownloadingToURL:(NSURL *)location{
    NSString* fullPath =
    [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
            stringByAppendingPathComponent:downloadTask.response.suggestedFilename];;
    [[NSFileManager defaultManager] moveItemAtURL:location
                                            toURL:[NSURL fileURLWithPath:fullPath]
                                            error:nil];
    NSLog(@"%@",fullPath);
}
// 请求完成，错误调用的代理方法
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
}
@end
