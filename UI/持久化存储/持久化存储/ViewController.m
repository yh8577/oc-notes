//
//  ViewController.m
//  持久化存储
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "coding.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *arrM;
@end

@implementation ViewController

- (NSMutableArray *)arrM {
    if (!_arrM) {
        _arrM = [NSMutableArray array];
    }
    return _arrM;
}

- (NSString *)filePath {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docPath stringByAppendingPathComponent:@"tel.data"];
    return filePath;
}

// 路径
- (NSString *)takePath {
    // 第1种
    /*
     NSString *homePath = NSHomeDirectory();
     // 需要加 "/"
     //    NSString *docPath = [homePath stringByAppendingString:@"/Documents"];
     // 不需要 "/"
     NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
     */
    // 第2种
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [docPath stringByAppendingPathComponent:@"arr.plist"];
    return filePath;
}

#pragma mark -- 数组存取
- (IBAction)save:(id)sender {

    NSString *filePath = [self takePath];
    // 数组存储
    NSArray *arr  = @[@"123",@"234",@"345",@"456"];
    [arr writeToFile:filePath atomically:YES];
 
}

- (IBAction)read:(id)sender {
    
    NSString *filePath = [self takePath];
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",arr);
   
}
#pragma mark -- 字典存取
- (IBAction)dictSave:(id)sender {
    
    NSString *filePath = [self takePath];
    NSDictionary *dict = @{@"aaa":@"bbb"};
    [dict writeToFile:filePath atomically:YES];
}

- (IBAction)dictRead:(id)sender {
    NSString *filePath = [self takePath];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@",dict);
}

#pragma mark -- 偏好存取
- (IBAction)defaultsSave:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"value" forKey:@"key"];
    [ud setBool:NO forKey:@"isOn"];
    [ud synchronize]; //立即写入
}

- (IBAction)defaultsRead:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[ud objectForKey:@"key"]);
    NSLog(@"%@",[ud boolForKey:@"isOn"]?@"yes":@"no");
}


#pragma mark -- 归档存取
- (IBAction)codingSave:(id)sender {
   
    coding *cd = [[coding alloc] init];

    cd.name =  [NSString stringWithFormat:@"%d",arc4random_uniform(1000000)];
    cd.tel = [NSString stringWithFormat:@"%d",arc4random_uniform(1000000)];
    [self.arrM addObject:cd];
    
    NSString *filePath = [self filePath];
    
    [NSKeyedArchiver archiveRootObject:self.arrM toFile:filePath];
    
}

- (IBAction)codingRead:(id)sender {
    
    NSString *filePath = [self filePath];
    self.arrM = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    for (coding *cd in self.arrM) {
        NSLog(@"%@, %@",cd.name, cd.tel);
    }
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
