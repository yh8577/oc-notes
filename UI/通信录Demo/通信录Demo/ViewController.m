//
//  ViewController.m
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "VC1TableController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
@property (weak, nonatomic) IBOutlet UISwitch *sw2;

@end

@implementation ViewController

- (void)saveDefaultsWithBool:(BOOL)isBool {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:isBool forKey:@"sw1isOn"];
    [ud setBool:isBool forKey:@"sw2isOn"];
    [ud synchronize]; //立即写入
}

- (NSUserDefaults *)readDefaults {
    
    return  [NSUserDefaults standardUserDefaults];
}

- (IBAction)sw1Click:(UISwitch *)sender {
    
    if (!sender.isOn) {
        NSLog(@"NO");
        [self.sw2 setOn:NO animated:YES];
        [self saveDefaultsWithBool:NO];
    }
    
    
}
- (IBAction)sw2Click:(UISwitch *)sender {
    if (sender.isOn) {
        NSLog(@"YES");
        [self.sw1 setOn:YES animated:YES];
        [self saveDefaultsWithBool:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   /*
    segue 分自动型和手动型
    如果是不需要要判断直接跳转就用自动型
    如果需要判断那就使用手动型
    */
    VC1TableController *vc1 = segue.destinationViewController;
    vc1.navigationItem.title = self.text1.text;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 注意点由于 UITextField 继承自 UIControl 所以可以通过 addTarget 监听文本框的输入
    [self.text1 addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [self.text2 addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [self textChange];
    
    NSUserDefaults *ud = [self readDefaults];
    
    self.sw1.on = [ud boolForKey:@"sw1isOn"];
    self.sw2.on = [ud boolForKey:@"sw2isOn"];
    NSLog(@"%@",[ud boolForKey:@"sw1isOn"]?@"YES":@"NO");
}



- (void)textChange {
    
    self.login.enabled = self.text1.text.length > 0 && self.text2.text.length > 0;
    
}

- (IBAction)loginClicl:(id)sender {
    
    if ([self.text1.text isEqualToString:@"1"] && [self.text2.text isEqualToString:@"2"]) {
        UILabel *v = [[UILabel alloc] init];
        CGFloat vW = 100;
        CGFloat vH = 100;
        CGFloat vX = (self.view.bounds.size.width - vW) * 0.5;
        CGFloat vY = (self.view.bounds.size.height - vH) * 0.5;
        v.frame = CGRectMake(vX, vY, vW, vH);
        v.backgroundColor = [UIColor darkGrayColor];
        v.text = @"正在加载....";
        v.textColor = [UIColor whiteColor];
        v.font = [UIFont systemFontOfSize:15];
        v.textAlignment = NSTextAlignmentCenter;
        v.alpha = 0;
        v.layer.cornerRadius = 15;
        v.layer.masksToBounds = YES;
        [self.view addSubview:v];
        
        [UIView animateWithDuration:0.5 animations:^{
            v.alpha = 0.9;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.5 delay:0.5 options:(UIViewAnimationOptionCurveLinear) animations:^{
                    v.alpha = 0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [v removeFromSuperview];
                        [self performSegueWithIdentifier:@"vc1" sender:nil];
                    }
                }];
            }
        }];

        
    } else {
        
        UILabel *v = [[UILabel alloc] init];
        CGFloat vW = 100;
        CGFloat vH = 100;
        CGFloat vX = (self.view.bounds.size.width - vW) * 0.5;
        CGFloat vY = (self.view.bounds.size.height - vH) * 0.5;
        v.frame = CGRectMake(vX, vY, vW, vH);
        v.backgroundColor = [UIColor darkGrayColor];
        v.text = @"密码错误....";
        v.textColor = [UIColor whiteColor];
        v.font = [UIFont systemFontOfSize:15];
        v.textAlignment = NSTextAlignmentCenter;
        v.alpha = 0;
        v.layer.cornerRadius = 15;
        v.layer.masksToBounds = YES;
        [self.view addSubview:v];

        [UIView animateWithDuration:0.5 animations:^{
            v.alpha = 0.9;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:1.0 delay:1.0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                    v.alpha = 0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [v removeFromSuperview];
                    }
                }];
            }
        }];
        
    }
    
    
}

@end
