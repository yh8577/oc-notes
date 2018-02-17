//
//  ViewController.m
//  oc_day1
//
//  Created by jyh on 2018/1/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Dog.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    Student *s = [[Student alloc] init];
    
    [s setName:@"毛哲东"];
    [s setAge:19];
    [s setEnglish:99];
    [s setMathematics:88];
    [s setChinese:50];
    
    [s introduce];
    
    
    Dog *d = [[Dog alloc] init];
    
    d.speed = 100;
    d.color = @"黄色";
    
    [d call];
    [d run];
    
     */
    Person *p = [[Person alloc] init];
    [p callWithPhoneNum:@"10000"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
