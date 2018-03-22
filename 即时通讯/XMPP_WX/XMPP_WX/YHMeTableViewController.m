//
//  YHMeTableViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHMeTableViewController.h"
#import "YHManagerStream.h"
@interface YHMeTableViewController ()<XMPPvCardTempModuleDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *desc;

// 获取内存存储
@property (nonatomic, strong) XMPPvCardTemp *myvCardTemp;
@end

@implementation YHMeTableViewController

- (XMPPvCardTemp *)myvCardTemp {
    if (!_myvCardTemp) {
        _myvCardTemp = [YHManagerStream sharedInstance].xmppVCardTempModule.myvCardTemp;
    }
    return _myvCardTemp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置多播代理
    [[YHManagerStream sharedInstance].xmppVCardTempModule addDelegate:self delegateQueue:dispatch_get_main_queue()];
    // 设置参数
    [self updata];
   
}

// 设置参数
- (void)updata {
    // 头像
    self.iconView.image = [UIImage imageWithData:self.myvCardTemp.photo];
    // 名字
    self.name.text = [YHManagerStream sharedInstance].xmppStream.myJID.bare;
    // 昵称
    self.nickname.text = self.myvCardTemp.nickname;
    // 个性签名
    self.desc.text = self.myvCardTemp.desc;
}

- (void)xmppvCardTempModuleDidUpdateMyvCard:(XMPPvCardTempModule *)vCardTempModule {
    // 清除内存
    self.myvCardTemp = nil;
    // 数据更新
    [self updata];
}

@end
