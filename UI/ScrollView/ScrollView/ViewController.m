//
//  ViewController.m
//  ScrollView
//
//  Created by jyh on 2018/2/2.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn8;


@property(nonatomic,strong)NSArray *arr;
//@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;

@end

@implementation ViewController


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    NSLog(@"即将开始");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"正在滚动");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSLog(@"拖拽完毕");
}


- (NSArray *)arr {
    
    if (!_arr) {
        _arr = @[@"7",@"8"];
    }
    
    return _arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    CGFloat maxH = CGRectGetMaxY(self.btn8.frame);

    self.scrollV.contentSize = CGSizeMake(0, maxH);

    NSLog(@"%f",maxH);
}



@end




































