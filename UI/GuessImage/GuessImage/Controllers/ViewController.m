//
//  ViewController.m
//  GuessImage
//
//  Created by jyh on 2018/2/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestionMmodel.h"
@interface ViewController ()


@property(nonatomic,strong)NSArray *questions;
@property (weak, nonatomic) IBOutlet UIView *answerView;
- (IBAction)promptBtnClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *optionView;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property(nonatomic,assign)int index;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UIButton *btnMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)btnNextClick:(UIButton *)sender;
- (IBAction)bigBtnIcon:(UIButton *)sender;



@end

@implementation ViewController

// 数据懒加载
- (NSArray *)questions {
    
    if (!_questions) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
        NSMutableArray *arrayModel = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arr) {
            CZQuestionMmodel *model = [CZQuestionMmodel questionWithDict:dict];
            [arrayModel addObject:model];
        }
        _questions = arrayModel;
    }
    return _questions;
}

// 设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = -1;
    // 加载数据
    [self loadData];
}

// 下一张
- (IBAction)btnNextClick:(UIButton *)sender {

    [self loadData];
    
}

// 加载数据
- (void)loadData{
    
    self.index ++;
    
    if (self.index >= self.questions.count) {

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜" message:@"您已全部过关......" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            self.index = -1;
            [self loadData];
        }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    // 获取模型
    CZQuestionMmodel *model = self.questions[self.index];
    
    [self setViewsWithModel:model];
}

- (void)setViewsWithModel:(CZQuestionMmodel *)model {
    
    // 最后一个禁用按钮点击
    self.btnNext.enabled = self.index != (self.questions.count - 1);
    // 设置 第几个/总个数
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%lu", self.index+1,self.questions.count];
    // 设置图片
    self.imageIcon.image = [UIImage imageNamed:model.icon];
    // 设置提示视图
    self.lblTitle.text = model.title;
    [self.lblTitle setTextColor:[UIColor whiteColor]];
    
    [self setAnswerBtnWithModel:model];
    
    [self setOptionsBtnWithModel:model];
}

// 答案按钮
- (void)setAnswerBtnWithModel:(CZQuestionMmodel *)model {
    
    // 清空 UITextField
//    for (UITextView *tx in self.answerView.subviews) {
//        [tx removeFromSuperview];
//    }
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 初始化 UITextField 的 frame
    int tFCount = (int)model.answer.length;
    CGFloat tFmg = 2;
    CGFloat tFw = 35;
    CGFloat tFh = tFw;
    CGFloat tFx = (self.answerView.frame.size.width - (tFw + tFmg) * tFCount) * 0.5;
    CGFloat tFy = (self.answerView.frame.size.height - tFh) * 0.5;
    // 循环创建 UITextField
    for (int i = 0 ; i < tFCount; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(tFx, tFy, tFw, tFh);
        tFx += tFmg * 2 + tFw;
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(answerBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.answerView addSubview: btn];
    }
}

// 待选答案按钮
- (void)setOptionsBtnWithModel:(CZQuestionMmodel *)model {
    
    self.optionView.userInteractionEnabled = YES;
    //    for (UIButton *bt in self.optionView.subviews) {
    //        [bt removeFromSuperview];
    //    }
    
    
    [self.optionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    int btnColnum = 8;
    int count = (int)model.options.count;
    CGFloat btnW = 35;
    CGFloat btnH = btnW;
    CGFloat btnMg = 10;
    CGFloat btnMgLeft = (self.optionView.frame.size.width - btnW * btnColnum - (btnColnum - 1) * btnMg) * 0.5;
    CGFloat btnMgTop = (self.optionView.frame.size.height - (count / btnColnum) * (btnH + btnMg)) * 0.5;
    for (int i = 0; i < count ; i++) {
        NSString *str = model.options[i];
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setTitle:str forState:(UIControlStateNormal)];
        int col = i % btnColnum;
        int row = i / btnColnum;
        CGFloat btnX = btnMgLeft + (btnMg + btnW) * col;
        CGFloat btnY = btnMgTop + (btnMg + btnH) * row;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.backgroundColor = [UIColor grayColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(optionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.optionView addSubview:btn];
    }
}
- (void)optionBtn:(UIButton *)sender {
    
    sender.hidden = YES;
    
    
    // 获取 UIControlStateNormal 状态下的文字
//    NSString *text = [sender titleForState:(UIControlStateNormal)];
    // 获取当前状态下的文字
    NSString *text = sender.currentTitle;
    
    for (UIButton *btn in self.answerView.subviews) {
        
        if (btn.currentTitle == nil) {
            [btn setTitle:text forState:(UIControlStateNormal)];
            btn.tag  = sender.tag;;
            break;
        }
    }
    
    BOOL isFull = YES;
    
    NSMutableString *userInput = [NSMutableString string];
    
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle == nil) {
            isFull = NO;
            break;
        } else {
            
            [userInput appendString:btn.currentTitle];
        }
    }
    
    if (isFull) {
        
        self.optionView.userInteractionEnabled = NO;
        
        if (self.index >= self.questions.count) {
            self.index = -1;
            [self loadData];
            return;
        }
        
        CZQuestionMmodel *model = self.questions[self.index];
        
        if ([model.answer isEqualToString:userInput]) {
            [self setAnsweruttonTitleColor:[UIColor blueColor]];
            
            [self addMoney:100];
            
            // 0.5秒后执行方法
            [self performSelector:@selector(loadData) withObject:nil afterDelay:0.5];
            
        } else {
            
            [self setAnsweruttonTitleColor:[UIColor redColor]];
        }
    }
}

// 加减分 
- (void)addMoney:(int)score{
    
    NSString *strMoney = self.btnMoney.currentTitle;
    int money = strMoney.intValue;
    money += score;
    [self.btnMoney setTitle:[NSString stringWithFormat:@"%d",money] forState:(UIControlStateNormal)];
}

- (void)answerBtn:(UIButton *)sender {
    
    self.optionView.userInteractionEnabled = YES;
    
    [self setAnsweruttonTitleColor:[UIColor blackColor]];
    
    for (UIButton *btn in self.optionView.subviews) {
        if (btn.tag == sender.tag) {
            btn.hidden = NO;
            break;
        }
    }
    
    [sender setTitle:nil forState:(UIControlStateNormal)];
}

- (void)setAnsweruttonTitleColor:(UIColor *)color {
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:color forState:(UIControlStateNormal)];
    }
}

//  放大图
- (IBAction)bigBtnIcon:(UIButton *)sender {
    [self.view bringSubviewToFront:self.imageIcon];
    [UIView animateWithDuration:1.0 animations:^{
        self.imageIcon.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        if (finished) {
            UIButton *bgB = [UIButton buttonWithType:(UIButtonTypeCustom)];
            bgB.frame = self.view.bounds;
            [bgB addTarget:self action:@selector(bgBClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.view addSubview:bgB];
        }
    }];
}

// 缩小图
- (void)bgBClick:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{
        self.imageIcon.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view insertSubview:self.imageIcon atIndex:1];
            [sender removeFromSuperview];
        }
    }];
}


- (IBAction)promptBtnClick:(UIButton *)sender {
    [self addMoney:-1000];
    for (UIButton *btn in self.answerView.subviews) {
        [self answerBtn:btn];
    }
    CZQuestionMmodel *model = self.questions[self.index];
//    NSString *toStr = [model.answer substringToIndex:1];
//    for (UIButton *btn in self.optionView.subviews) {
//        if ([toStr isEqualToString:btn.currentTitle]) {
//            [self optionBtn:btn];
//            //break;
//        }
//    }
    
    for (int i = 1; i <= model.answer.length; i++) {
        NSRange range = {i-1,1};
        NSString *toStr = [model.answer substringWithRange:range];
        for (UIButton *btn in self.optionView.subviews) {
            if ([toStr isEqualToString:btn.currentTitle]) {
                NSLog(@"btn  = %@",btn.currentTitle);
                [self optionBtn:btn];
                //break;
            }
        }
    }
}
@end
