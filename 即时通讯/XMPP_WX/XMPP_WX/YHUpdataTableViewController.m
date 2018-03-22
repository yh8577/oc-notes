//
//  YHUpdataTableViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHUpdataTableViewController.h"
#import "YHManagerStream.h"

@interface YHUpdataTableViewController ()<XMPPvCardTempModuleDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textMesage;
@property (nonatomic, strong) XMPPvCardTemp *myvCardTemp;
@end

@implementation YHUpdataTableViewController

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
}

- (IBAction)updataCornect:(id)sender {
    if ([self.title isEqualToString:@"个性签名"]) {
        self.myvCardTemp.desc = self.textMesage.text;
    } else if ([self.title isEqualToString:@"昵称"]) {
        self.myvCardTemp.nickname = self.textMesage.text;
    }
    
    [[YHManagerStream sharedInstance].xmppVCardTempModule updateMyvCardTemp:self.myvCardTemp];
    
    [self.navigationController popViewControllerAnimated:YES];
}




@end
