//
//  ViewController.m
//  画板demo
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "QDView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet QDView *qdvew;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthProgress;

@end

@implementation ViewController

// 橡皮
- (IBAction)eraser:(id)sender {
    [self.qdvew eraser];
}

// 回退
- (IBAction)back:(id)sender {
    [self.qdvew back];
}

// 清屏
- (IBAction)clear:(id)sender {
    [self.qdvew clear];
}



- (IBAction)save:(id)sender {
    
    UIGraphicsBeginImageContextWithOptions(self.qdvew.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.qdvew.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    
}



- (IBAction)lineWidthChange:(UISlider *)sender {
    
    NSLog(@"%f",sender.value);
    self.qdvew.lineWidth = sender.value;
    
}
- (IBAction)lineColorBtn:(UIButton *)sender {
    
    self.qdvew.lineColor = sender.backgroundColor;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.qdvew.lineWidth = self.lineWidthProgress.value;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
