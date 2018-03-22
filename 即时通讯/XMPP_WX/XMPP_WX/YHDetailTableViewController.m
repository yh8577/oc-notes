//
//  YHDetailTableViewController.m
//  XMPP_WX
//
//  Created by jyh on 2018/3/22.
//  Copyright © 2018年 huig. All rights reserved.
//

#import "YHDetailTableViewController.h"
#import "YHManagerStream.h"
@interface YHDetailTableViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,XMPPvCardTempModuleDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (nonatomic, strong) XMPPvCardTemp *myvCardTemp;
@end

@implementation YHDetailTableViewController


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

    [self updata];
}

- (void)updata {
    
    
    // 头像
    UIImage *image = [UIImage imageWithData:self.myvCardTemp.photo];
    if (image) {
        self.iconView.image = image;
    }
    // 名字
    self.name.text = [YHManagerStream sharedInstance].xmppStream.myJID.bare;
    // 昵称
    self.nickname.text = self.myvCardTemp.nickname;
    // 个性签名
    self.desc.text = self.myvCardTemp.desc;
}


- (IBAction)pickerImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // 参数设置
    // 运行编辑
    picker.allowsEditing = YES;
    // 代理
    picker.delegate = self;
    
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}

// 选中图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 获取图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.2);
    // 更新头像信息
    self.myvCardTemp.photo = imageData;
    [[YHManagerStream sharedInstance].xmppVCardTempModule updateMyvCardTemp:self.myvCardTemp];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

// 取消选择
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)xmppvCardTempModuleDidUpdateMyvCard:(XMPPvCardTempModule *)vCardTempModule {
    // 清除内存
    self.myvCardTemp = nil;
    // 数据更新
    [self updata];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"desc"]) {
        segue.destinationViewController.title = @"个性签名";
    } else if ([segue.identifier isEqualToString:@"nickname"]) {
        segue.destinationViewController.title = @"昵称";
    }
}

@end
