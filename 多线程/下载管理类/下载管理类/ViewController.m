//
//  ViewController.m
//  下载管理类
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "Download.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property(nonatomic,strong)NSMutableDictionary *imageCache;
@property(nonatomic,strong)NSArray *imageData;
@end

@implementation ViewController

- (NSMutableDictionary *)imageCache {
    if (!_imageCache) {
        _imageCache = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    return _imageCache;
}

- (NSArray *)imageData {
    if (!_imageData) {
        _imageData = [Download download];
    }
    return _imageData;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    int index = arc4random_uniform((u_int32_t)(self.imageData.count));
    Download *model = self.imageData[index];
    
    [self.imageV setImageUrlString:model.icon];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
