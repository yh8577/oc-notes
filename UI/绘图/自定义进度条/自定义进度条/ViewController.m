//
//  ViewController.m
//  自定义进度条
//
//  Created by jyh on 2018/2/14.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "QDView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet QDView *qdView;
@end

@implementation ViewController

- (IBAction)progressChange:(UISlider *)sender {
    self.qdView.number = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
