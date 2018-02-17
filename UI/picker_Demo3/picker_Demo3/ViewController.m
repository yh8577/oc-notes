//
//  ViewController.m
//  picker_Demo3
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Flags.h"
#import "flagsPickView.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray *flagData;
@end

@implementation ViewController

- (NSArray *)flagData {
    if (!_flagData) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Flags *flagsModel = [Flags flagsWithDict:obj];
            [arrM addObject:flagsModel];
        }];
        _flagData = arrM;
    }
    return _flagData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark -- UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.flagData.count;
}

#pragma mark -- UIPickerViewDelegate

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    
//    Flags *model = self.flagData[row];
//
//    return model.name;
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    flagsPickView *flagView = [flagsPickView flagsPickView];

    flagView.model = self.flagData[row];
    
    return flagView;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 100;
}


@end
