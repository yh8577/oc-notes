//
//  ViewController.m
//  图片浏览器
//
//  Created by jyh on 2018/1/30.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property(nonatomic,strong)NSArray *pic;
@property(nonatomic,assign)int index;;
@property (weak, nonatomic) IBOutlet UIButton *low;
@property (weak, nonatomic) IBOutlet UIButton *up;

- (IBAction)show:(UIButton *)sender;

@end

@implementation ViewController

// 懒加载
- (NSArray *)pic {
    if (_pic == nil) {
        
        // 获取 app 根目录中的文件地址
       // NSString *path = [[NSBundle mainBundle] pathForResource:@"pic1.plist" ofType:nil];
//        NSArray *array = [NSArray arrayWithContentsOfFile:path];
//        NSLog(@"%@",array);
        
    NSArray *array1 = @[
                       @{@"icon":@"1",@"title":@"麻花脸"},
                       @{@"icon":@"2",@"title":@"落日"},
                       @{@"icon":@"3",@"title":@"动物"},
                       @{@"icon":@"4",@"title":@"瀑布"},
                       @{@"icon":@"5",@"title":@"夜景"},
                       @{@"icon":@"1",@"title":@"麻花脸"},
                       @{@"icon":@"2",@"title":@"落日"},
                       @{@"icon":@"3",@"title":@"动物"},
                       @{@"icon":@"4",@"title":@"瀑布"},
                       @{@"icon":@"5",@"title":@"夜景"}
                       ];
        // 获取沙盒路径
        NSString *pathStr =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES).firstObject;
        // 拼接path 和文件名称
        NSString *path = [NSString stringWithFormat:@"%@/pic1.plist",pathStr];
        // 保存到沙盒文件
        [array1 writeToFile:path atomically:NO];
        
        // 读取沙盒文件
        _pic = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _pic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1:
            self.index--;
            break;
        case 2:
            self.index++;
            break;
    }
    
    [self loadData];
}

- (void)loadData{
    self.up.enabled = (self.index > 0);
    self.low.enabled = (self.index != (self.pic.count - 1));
    NSDictionary *dict = self.pic[self.index];
    self.topLabel.text = [NSString stringWithFormat:@"%d/%ld",self.index+1,self.pic.count];
    self.iconImg.image = [UIImage imageNamed:dict[@"icon"]];
    self.bottomLabel.text = [NSString stringWithFormat:@"%@",dict[@"title"]];
}

@end
