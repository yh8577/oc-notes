//
//  ViewController.h
//  DownloadTest
//
//  Created by chuliangliang on 16/6/28.
//  Copyright © 2016年 chuliangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *taskProgress;
@property (weak, nonatomic) IBOutlet UIButton *task1Cancel;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;
- (IBAction)taskButtonAction:(UIButton *)sender;
- (IBAction)task1CancelAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *taskLabel2;
@property (weak, nonatomic) IBOutlet UIProgressView *taskProgress2;
@property (weak, nonatomic) IBOutlet UIButton *taskButton2;
@property (weak, nonatomic) IBOutlet UIButton *task2Cancel;
- (IBAction)taskButton2action:(UIButton *)sender;
- (IBAction)task2CancelAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *taskLabel3;
@property (weak, nonatomic) IBOutlet UIProgressView *taskProgress3;
@property (weak, nonatomic) IBOutlet UIButton *taskButton3;
@property (weak, nonatomic) IBOutlet UIButton *task3Cancel;
- (IBAction)taskButton3Action:(id)sender;
- (IBAction)task3CancelAction:(UIButton *)sender;
@end

