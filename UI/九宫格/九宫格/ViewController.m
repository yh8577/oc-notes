//
//  ViewController.m
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "appModel.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *apps;
@property(nonatomic,strong)UIView *iconView;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation ViewController

- (NSArray *)apps {
    
    if (_apps == nil) {
        
        NSArray *arr = @[
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                         @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"},
                        @{@"title":@"jias",@"img":@"tabbar_compose_camera"}];
        
        NSMutableArray *arrModels = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in arr) {
            
            appModel *model = [appModel modelWithDict:dict];
            
            [arrModels addObject:model];
        }
        
        _apps = arrModels;
     
    }
    
    return  _apps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setView];
    
}

- (void)setView{
    
    [self showView];
}

- (void)showView {
    
    int column = 3;
    CGFloat w = 75;
    CGFloat h = 120;
    CGFloat mgX = (self.view.frame.size.width - w * column) / 4;;
    CGFloat topY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        
        self.iconView = [[UIView alloc] init];
        int col = i % column; // 求列
        int row = i / column; // 求行
        CGFloat x = mgX + (mgX + w) * col;
        CGFloat y = topY + (topY + h) * row;
        self.iconView.frame = CGRectMake(x, y , w, h);
        [self.view addSubview:self.iconView];
        self.iconView.clipsToBounds = YES;
        
        appModel *model = self.apps[i];
    
        [self setImamgeViewWithImageNanme:model.img];

        [self setLabelWithTitle:model.title];

        [self setButton];
    }
}

- (void)setImamgeViewWithImageNanme:(NSString *)imageName {
    self.imgView = [[UIImageView alloc] init];
    self.imgView.frame = CGRectMake((self.iconView.frame.size.width - 50) * 0.5, 0, 50, 50);
    self.imgView.image = [UIImage imageNamed:imageName];
    [self.iconView addSubview:self.imgView];
}

- (void)setLabelWithTitle:(NSString *)title {
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake((self.iconView.frame.size.width - 75) * 0.5, CGRectGetMaxY(self.imgView.frame) + 5, 75, 25);
    self.label.text = title;
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.iconView addSubview:self.label];
}

- (void)setButton {
    self.btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.btn.frame = CGRectMake((self.iconView.frame.size.width - 75) * 0.5, CGRectGetMaxY(self.label.frame) + 5, 75, 25);
    self.btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.btn setTitle:@"下载" forState:(UIControlStateNormal)];
    [self.btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:(UIControlStateNormal)];
    [self.iconView addSubview:self.btn];
}

@end
