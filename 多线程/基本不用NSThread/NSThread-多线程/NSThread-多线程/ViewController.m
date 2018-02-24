//
//  ViewController.m
//  NSThread-多线程
//
//  Created by jyh on 2018/2/22.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign)int num;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.num = 10;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 多线程属性
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo1) object:nil];

    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo1) object:nil];

    [thread2 start];
}

- (void)demo1 {

    while (YES) {
        [NSThread sleepForTimeInterval:1];
        
        // 多线程访问数据安全锁,避免数据重复.
        @synchronized(self) {
            if (self.num > 0) {
                self.num-=1;
                NSLog(@" 剩余:%d",self.num);
            } else {
                NSLog(@"没有了");
                break;
            }
        }
        
    }
}


- (void)test1 {
    
    // 多线程属性
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    thread1.name = @"t1"; // 线程名称
    thread1.threadPriority = 1.0; // 线程优先级
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    thread2.name = @"t2";
    [thread2 start];
}




- (void)demo {
    for (int i = 0; i< 200; i++) {
        
        NSLog(@"%d, %@",i ,[NSThread currentThread]);
        
        if (i == 5) {
            
        // 阻塞状态
            [NSThread sleepForTimeInterval:3];
        }
//        if (i == 10) {
//
//            // 退出线程 , 当退出线程 .对象就会被销毁
//            [NSThread exit];
//        }
        
        // 线程执行完也会被销毁
    }
}


- (void)test {
    // 方法1
    /*
     NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demoWithName:) object:nil];
     
     [thread start];
     */
    
    // 方法2
    //    [NSThread detachNewThreadSelector:@selector(demoWithName:) toTarget:self withObject:@"haha"];
    
    // 方法3
    // [self performSelectorInBackground:@selector(demoWithName:) withObject:@"heihei"];
}

- (void)demoWithName:(NSString *)name {
    NSLog(@"%@, %@",name,[NSThread currentThread]);
}

@end
