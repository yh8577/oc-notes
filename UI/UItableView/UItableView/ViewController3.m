//
//  ViewController3.m
//  UItableView
//
//  Created by jyh on 2018/2/3.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController3.h"
#import "CZGroupedModel.h"
#import "CZCarModel.h"

@interface ViewController3 () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *grouped;
@end

@implementation ViewController3

- (NSArray *)grouped {
    
    if (!_grouped) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            
            CZGroupedModel *model = [CZGroupedModel groupedWithDict:dict];
            
            [arrM addObject:model];
            
        }
        _grouped = arrM;
    }
    return  _grouped;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.dataSource = self;
    
    
}

#pragma mark - UITableViewDataSource


// tableView 侧边索引条
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
//    NSMutableArray *arrM = [NSMutableArray array];
//    for (CZGroupedModel *model in self.grouped) {
//        [arrM addObject:model.title];
//    }
    
    return [self.grouped valueForKeyPath:@"title"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.grouped.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CZGroupedModel *model = self.grouped[section];
    return model.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    
    CZGroupedModel *groupM = self.grouped[indexPath.section];
    CZCarModel *carM = groupM.cars[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
    }
    
    cell.imageView.image = [UIImage imageNamed:carM.icon];
    cell.textLabel.text = carM.name;
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    CZGroupedModel *model = self.grouped[section];
    return model.title;
}

@end
