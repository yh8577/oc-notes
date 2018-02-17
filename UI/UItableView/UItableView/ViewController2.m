//
//  ViewController2.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController2.h"
#import "CitiesModel.h"
@interface ViewController2 ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)CitiesModel *model;
@end

@implementation ViewController2

- (NSArray *)array {
    
    if (!_array) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil];
        
        _array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSDictionary *dict in _array) {
            
            self.model = [CitiesModel citiesModelDict:dict];
            
            [arrayM addObject:self.model];
            
        }
        
        _array = arrayM;
    }
    return _array;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}



#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CitiesModel *model = self.array[section];

    return model.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"cellForRowAtIndexPath -- 组号:%ld, 行号:%ld",indexPath.section,indexPath.row);
    
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        NSLog(@"新建 -- 组号:%ld, 行号:%ld",indexPath.section,indexPath.row);
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    CitiesModel *model = self.array[indexPath.section];

    cell.textLabel.text = model.cities[indexPath.row];
    
    cell.accessoryView = [[UISwitch alloc] init];

    return cell;
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    for (int i = 0; i < self.array.count; i++) {
        CitiesModel *model = self.array[i];
        if (section == i) {
            return [NSString stringWithFormat:@"%@省",model.name];
        }
    }
    
    return @"";
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 60;
}

@end
