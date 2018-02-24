//
//  ViewController.m
//  模拟下载大批量图片
//
//  Created by jyh on 2018/2/23.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)NSMutableArray *imageM;
@end

@implementation ViewController

- (NSMutableArray *)imageM {
    if (!_imageM) {
        _imageM = [NSMutableArray array];
    }
    return _imageM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 1; i <= 1000; i++) {
        [self download:i];
    }

}


- (void)download:(int)index {
    // 这里不能使用dispatch_get_global_queue(0, 0)
    
     dispatch_queue_t  queue = dispatch_queue_create("Yh", DISPATCH_QUEUE_CONCURRENT);    dispatch_async(queue, ^{
        NSString *fileName = [NSString stringWithFormat:@"%d.jpg",index % 10 + 1];
        NSString *pathName = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathName];
         NSLog(@"下载图片 %@",fileName);
        // 阻塞,所有线程执行完了才会执行这段代码.
        dispatch_barrier_sync(dispatch_get_global_queue(0, 0), ^{
            [self.imageM addObject:image];
            NSLog(@"保存图片 ,%@",fileName );
        });
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%zd",self.imageM.count);
}

@end
