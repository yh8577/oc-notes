//
//  YHTabBarController.m
//  网易彩票
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHTabBarController.h"
#import "YHTabBar.h"


@interface YHTabBarController ()
@property (nonatomic,weak)UIButton *testButton;
@end

@implementation YHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *controllers = @[
    @{@"vc":@"LotteryHall",@"title": @"大厅",@"imageName":@"TabBar_LotteryHall"},
    @{@"vc":@"History",@"title": @"开奖信息",@"imageName":@"TabBar_History"},
    @{@"vc":@"Discovery",@"title": @"发现",@"imageName":@"TabBar_Discovery"},
    @{@"vc":@"Arena",@"title": @"竞技场",@"imageName":@"TabBar_Arena"},
    @{@"vc":@"MyLottery",@"title": @"我的彩票",@"imageName":@"TabBar_MyLottery"}];
   
    [self loadSubViewControllerWithSBName:controllers];

}

//- (void)loadSubViewControllerWithSBName:(NSArray *)controllers {
//
//    YHTabBar *tabBar = [[YHTabBar alloc] init];
//    tabBar.backgroundColor = [UIColor blackColor];
//
//    __weak YHTabBarController *weakSelf = self;
//    tabBar.tabBarButonBlock = ^(NSInteger index) {
//        weakSelf.selectedIndex = index;
////    };
//
//    tabBar.frame = CGRectMake(0, 0, kScreenWidth, 49);
//    NSMutableArray *arrVC = [NSMutableArray array];
//    for (int i = 0; i <controllers.count; ++i) {
//        NSDictionary *dict = controllers[i];
//
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:dict[@"vc"] bundle:nil];
//        UIViewController *vc = sb.instantiateInitialViewController;
//        vc.tabBarItem.image = [UIImage imageNamed:@"TabBar_Arena_selected_new"];
//        [arrVC addObject:vc];
//
//    }
//    self.viewControllers = arrVC;
//
//}

- (void)loadSubViewControllerWithSBName:(NSArray *)controllers {

    YHTabBar *tabBar = [[YHTabBar alloc] init];
    tabBar.backgroundColor = [UIColor blackColor];
    tabBar.frame = CGRectMake(0, 0, kScreenWidth, 49);
//    tabBar.frame = self.tabBar.frame;
    
    __weak YHTabBarController *weakSelf = self;
    tabBar.tabBarButonBlock = ^(NSInteger index) {
        weakSelf.selectedIndex = index;
    };

    NSMutableArray *arrVC = [NSMutableArray array];
    for (int i = 0; i <controllers.count; ++i) {
        NSDictionary *dict = controllers[i];

        UIStoryboard *sb = [UIStoryboard storyboardWithName:dict[@"vc"] bundle:nil];
        UIViewController *vc = sb.instantiateInitialViewController;
        [arrVC addObject:vc];

        [tabBar addButtonWithImageName:dict[@"imageName"]];
    }
    self.viewControllers = arrVC;
    
    [self.tabBar addSubview:tabBar];
//    [self.view addSubview:tabBar];
}


@end
