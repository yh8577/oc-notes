//
//  ViewController.m
//  storyboard传值
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

@implementation ViewController

- (IBAction)btn:(id)sender {
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController1 *vc1 = segue.destinationViewController;
    vc1.text = self.textF.text;
    
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
