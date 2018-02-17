//
//  ViewController.m
//  手势事件Demo
//
//  Created by jyh on 2018/2/16.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self test4];
    [self test5];

    

}

#pragma mark - 代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // yes 表示可以多手势.
    return YES;
}

-  (void)test6 {
    
    // 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    
    NSLog(@"拖拽 ");
    CGPoint p = [sender translationInView:sender.view];
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, p.x, p.y);
    
    // p 的归 0
    [sender setTranslation:CGPointZero inView:sender.view];

}


- (void)test5 {
    
    // 撮合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.imageV addGestureRecognizer:pinch];
    
}

- (void)pinch:(UIPinchGestureRecognizer *)sender {
    
    NSLog(@"撮合");
    
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, sender.scale, sender.scale);
    sender.delegate = self;
    sender.scale = 1;
}


- (void)test4 {
    // 旋转
    UIRotationGestureRecognizer *rota = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rota:)];
    [self.imageV addGestureRecognizer:rota];
}


- (void)rota:(UIRotationGestureRecognizer *)sender {

    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, sender.rotation);
    // rotation = 旋转弧度
    // velocity = 弧度内缩放的速度。
    
    // 多手势必须实现代理方法
    sender.delegate = self;
    
    sender.rotation = 0; // 注意点:每次旋转需要把 rotation 清零 否者在手指没有放开的旋转会一直累加
}


- (void)test3 {
    // 轻扫
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    swipe1.direction = UISwipeGestureRecognizerDirectionDown;
    [self.imageV addGestureRecognizer:swipe];
    [self.imageV addGestureRecognizer:swipe1];
}

- (void)swipe:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"向下轻扫");
    } else if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"向上轻扫");
    }
}


- (void)test2 {
    // 长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    //    minimumPressDuration = 长按多长时间响应事件
    //    allowableMovement = 等待长按时间之内,长按区域的误差范围.
    
    [self.imageV addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)sender {
    
    /*
     UIGestureRecognizerStatePossible,   // the recognizer has not yet recognized its gesture, but may be evaluating touch events. this is the default state
     
     UIGestureRecognizerStateBegan,      // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop
     UIGestureRecognizerStateChanged,    // the recognizer has received touches recognized as a change to the gesture. the action method will be called at the next turn of the run loop
     UIGestureRecognizerStateEnded,      // the recognizer has received touches recognized as the end of the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
     UIGestureRecognizerStateCancelled,  // the recognizer has received touches resulting in the cancellation of the gesture. the action method will be called at the next turn of the run loop. the recognizer will be reset to UIGestureRecognizerStatePossible
     
     UIGestureRecognizerStateFailed,     // the recognizer has received a touch sequence that can not be recognized as the gesture. the action method will not be called and the recognizer will be reset to UIGestureRecognizerStatePossible
     
     // Discrete Gestures – gesture recognizers that recognize a discrete event but do not report changes (for example, a tap) do not transition through the Began and Changed states and can not fail or be cancelled
     UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
     */
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按");
        
    }
}

- (void)test1 {
    // 敲击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self.imageV addGestureRecognizer:tap];
    
    tap.numberOfTapsRequired = 2; // 敲击次数,调用方法
    tap.numberOfTouchesRequired = 2; // 几个手指,一起敲击;
}

- (void)tap:(UITapGestureRecognizer *)sender {
    
    NSLog(@"敲击");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
