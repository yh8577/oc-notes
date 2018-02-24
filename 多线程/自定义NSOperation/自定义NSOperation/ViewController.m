//
//  ViewController.m
//  自定义NSOperation
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "YHDownloaderOperation.h"
#import "Download.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property(nonatomic,strong)NSOperationQueue *queue;
@property(nonatomic,strong)NSArray *imageArr;
@end

@implementation ViewController

- (NSArray *)imageArr {
    
    if (!_imageArr) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageData.plist" ofType:nil];
        _imageArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:10];
        
        
        _imageArr = arrM;
    }
    
    return _imageArr;
}

- (NSOperationQueue *)queue {
    
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    YHDownloaderOperation *op = [YHDownloaderOperation downloadOperationWithUrlString:@"http://pic.qiantucdn.com/58pic/13/19/30/68H58PICgNJ_1024.jpg" finshedBlock:^(UIImage *img) {
            self.imageV.image = img;
    
    }];
    

    [self.queue addOperation:op];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.queue cancelAllOperations]; 
}


@end
