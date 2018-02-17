//
//  ViewController.m
//  PickerView
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *fruit;
@property (weak, nonatomic) IBOutlet UILabel *food;
@property (weak, nonatomic) IBOutlet UILabel *drinks;
@property(nonatomic,strong)NSArray *pickerModel;
@end

@implementation ViewController

- (NSArray *)pickerModel {
    
    if (!_pickerModel) {
        _pickerModel = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"picker.plist" ofType:nil]];
    }
    
    return _pickerModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
- (IBAction)randomBtnClick {
    
    for (int i = 0; i < self.pickerModel.count; i++) {
        [self randomComponent:i];
    }
}

- (void)randomComponent:(int)component {
    
    NSInteger selRow = [self.picker selectedRowInComponent:component];
    
    NSInteger index = selRow;
    while (index == selRow) {
        index = arc4random_uniform((int)[self.pickerModel[component] count]);
    }
    
    [self.picker selectRow:index inComponent:component animated:YES];
    
    [self pickerView:self.picker didSelectRow:index inComponent:component];
    
}

#pragma mark -- UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.pickerModel.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerModel[component] count];
}

#pragma mark -- UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSLog(@"%@",self.pickerModel[component][row]);
    
    return self.pickerModel[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    NSString *str = self.pickerModel[component][row];

    switch (component) {
        case 0:
            self.fruit.text = str;
            break;
        case 1:
            self.food.text = str;
            break;
        case 2:
            self.drinks.text = str;
            break;
    }
}
@end
