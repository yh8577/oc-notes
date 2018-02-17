//
//  ViewController.m
//  Picker_Demo2
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "CityModel.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *province;
@property (weak, nonatomic) IBOutlet CityModel *setProvince;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property(nonatomic,strong)NSArray *cityModel;
@end

@implementation ViewController

- (NSArray *)cityModel {
    if (!_cityModel) {
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CityModel *model = [CityModel cityModelWithDict:obj];
            [arrM addObject:model];
        }];
        _cityModel = arrM;
    }
    return _cityModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self pickerView:self.picker didSelectRow:0 inComponent:0];
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return self.cityModel.count;
    } else
    {
        NSInteger selCol = [pickerView selectedRowInComponent:0];
        CityModel *model = self.cityModel[selCol];
        self.setProvince = model;
        return self.setProvince.cities.count;
    }
}


#pragma mark -- UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        CityModel *model = self.cityModel[row];
        return model.name;
    } else {
        
        return self.setProvince.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    NSInteger selProIdx = [pickerView selectedRowInComponent:0];
    NSInteger selCityIdx = [pickerView selectedRowInComponent:1];
    
    CityModel *model = self.cityModel[selProIdx];
    
    self.province.text = model.name;
    self.city.text = self.setProvince.cities[selCityIdx];
    
}

@end
