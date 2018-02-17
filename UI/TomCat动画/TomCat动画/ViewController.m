//
//  ViewController.m
//  TomCat动画
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)btnClick:(id)sender;

- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}

- (IBAction)btnClick:(id)sender {
    [self startAnimatingWithCount:45 andDirectoryNanme:@"holding_cake_ben"];
}

- (IBAction)btn1:(id)sender {
     [self startAnimatingWithCount:24 andDirectoryNanme:@"cuckoo"];
}

- (IBAction)btn2:(id)sender {
     [self startAnimatingWithCount:42 andDirectoryNanme:@"cuckoo_flame"];
}

- (IBAction)btn3:(id)sender {
     [self startAnimatingWithCount:45 andDirectoryNanme:@"holding_rose"];
}


- (void)startAnimatingWithCount:(int)count andDirectoryNanme:(NSString *)directoryNanme {
    
    // 判断动画是否在执行中,如果在执行中直接退出.
    if (self.imageView.isAnimating) {
        return;
    }
    
    // 从Animations.bundle 加载文件
//    // 1. 在main bundle中找到特定bundle
//    NSString *sampleBundlePath = [[NSBundle mainBundle] pathForResource:@"Animations.bundle" ofType:nil];
//    // 2. 载入bundle，即创建bundle对象
//    NSBundle *sampleBundle = [NSBundle bundleWithPath:sampleBundlePath];
//    // 3. 从bundle中获取资源路径
//    // 注意这里的图片位于通用资源目录下的Images二级目录，相对路径要明确这种关系
//    NSString *pic1Path = [sampleBundle pathForResource:directoryNanme ofType:nil];
    
    // 从Animations或Animations.bundle文件夹加载文件
    NSString *path = [NSString stringWithFormat:@"Animations/%@",directoryNanme];
    
    NSString *pic1Path = [[NSBundle mainBundle] pathForResource:path ofType:nil];
    
    // 创建一个可变数组用于保存图片
    NSMutableArray *arrarM = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        
        // 拼接图片名称
        NSString *str = [NSString stringWithFormat:@"%@/%04d.jpg",pic1Path,i];
        // 创建图片
        // 如果使用这个方法加载大批量图片,会占用很大内存无法释放.加载大批量图片不要使用
//        UIImage *img = [UIImage imageNamed:str];
        // 大批量加载图片建议使用这种方法
        UIImage *img = [UIImage imageWithContentsOfFile:str];
        // 添加图片到数组中
        [arrarM addObject:img];
    }
    
    // 添加图片数组给 imageView
    self.imageView.animationImages = arrarM;
    
    // 设置动画执行时间
    self.imageView.animationDuration = arrarM.count * 0.1;
    
    // 设置动画执行次数
    self.imageView.animationRepeatCount = 1;
    
    // 开始执行动画
    [self.imageView startAnimating];
    
    // 停止动画
    //    [self.imageView stopAnimating];
    
    // 动画执行完成后清空animationImages避免占用内存
    /*
     performSelector: 调用的方法
     withObject: 方法的 参数
     afterDelay: 延迟多长时间开始执行方法
     */
    
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:arrarM.count * 0.1];
}



@end
