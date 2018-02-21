//
//  ViewController.m
//  应用名称国际化, storyboard改法
//
//  Created by jyh on 2018/2/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     在工程设置选择 project -> locallzations -> 里面添加一个语言
     选中 选中 storyboard 在配置页面  locallzations  把语言勾选上.
     选中 storyboard 里面会多出 语言文件在对应语言的文件中修改对应的控件显示语言
     
     // 注意点: 最好在是控件都添加完了在做语言国际化.
                如果出现控件有变化.把需要在 storyboard 里面把对应选中的语言勾选去掉 然后选删除.然后咋爱重新勾选对应的语言.就有新添加的控件了.
     */
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
