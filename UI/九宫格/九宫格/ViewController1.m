//
//  ViewController1.m
//  九宫格
//
//  Created by jyh on 2018/1/31.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController1.h"
#import "appModel.h"
#import "appView.h"
@interface ViewController1 ()
@property(nonatomic,strong)NSArray *apps;
@end



@implementation ViewController1

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
    CGFloat h = 90;
    CGFloat mgX = (self.view.frame.size.width - w * column) / (column + 1) ;;
    CGFloat topY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        
        appView *appview = [appView appView];
        int col = i % column; // 求列
        int row = i / column; // 求行
        
        CGFloat x = mgX + (mgX + w) * col;
        CGFloat y = topY + (topY + h) * row;
        
        appview.frame = CGRectMake(x, y , w, h);
        [self.view addSubview:appview];
        appview.clipsToBounds = YES;
        appModel *model = self.apps[i];
        
        appview.model = model;
        
    }
}


@end
