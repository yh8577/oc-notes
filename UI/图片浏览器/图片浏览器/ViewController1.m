//
//  ViewController1.m
//  图片浏览器
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property(nonatomic,strong)UILabel *topLabel;
@property(nonatomic,strong)UILabel *bottomLabel;
@property(nonatomic,strong)UIImageView *iconImg;
@property(nonatomic,strong)NSArray *pic;
@property(nonatomic,assign)int index;;
@property(nonatomic,strong)UIButton *low;
@property(nonatomic,strong)UIButton *up;
@end

@implementation ViewController1

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
  
    [self setView];
    
    [self loadData];

    
}
- (void)clickBtn1{
  
    self.index--;

    [self loadData];
}
- (void)clickBtn2{

    self.index++;

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

- (void)setView{
    CGRect rect = CGRectMake((self.view.frame.size.width - 100) * 0.5, 50, 100, 30);
    self.topLabel = [self setLabelWithFrame:rect];
    
    [self setImageView];
    
    rect.origin.y = self.iconImg.frame.origin.y + self.iconImg.frame.size.height + 30;
    self.bottomLabel = [self setLabelWithFrame:rect];
    
    
    rect = CGRectMake(self.iconImg.frame.origin.x, self.bottomLabel.frame.origin.y + self.bottomLabel.frame.size.height + 30, 50, 30);
   self.up = [self setButtonWithFrame:rect andAction:@selector(clickBtn1) andTitle:@"上一张"];
    
    
    rect.origin.x = self.iconImg.frame.origin.x + self.iconImg.frame.size.width - 50;
    self.low = [self setButtonWithFrame:rect andAction:@selector(clickBtn2) andTitle:@"下一张"];
    
}

- (UIButton *)setButtonWithFrame:(CGRect)frame andAction:(SEL)action andTitle:(NSString*)title{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    btn.frame = frame;//
    [btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateHighlighted)];
    [btn addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    btn.adjustsImageWhenHighlighted = NO;
    [btn sizeToFit];
    [self.view addSubview:btn];
    return btn;
}

- (void)setImageView{
    
    CGRect rect = CGRectMake((self.view.frame.size.width - 300) * 0.5, self.topLabel.frame.origin.y+self.topLabel.frame.size.height+30, 300, 300);
    self.iconImg = [[UIImageView alloc] initWithFrame:rect];
    self.iconImg.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.iconImg];
}

- (UILabel *)setLabelWithFrame:(CGRect)frame{
    CGRect rect = frame;
    UILabel *label = [[UILabel alloc] initWithFrame: rect];
    label.text = @"1/6";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    return label;
}

@end
