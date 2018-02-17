//
//  ViewController.m
//  碰撞-代理方法
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"



@interface BGView : UIView
@property(nonatomic,assign)CGRect redRect;
@end

@implementation BGView

- (void)drawRect:(CGRect)rect {
    
    //    UIBezierPath *path = [[UIBezierPath alloc] init];;
    //    [path moveToPoint:CGPointMake(0, 200)];
    //    [path addLineToPoint:CGPointMake(120, 250)];
    //
    //    [path stroke];
    
    [[UIBezierPath bezierPathWithRect:self.redRect] stroke];
    
}

@end

@interface ViewController ()<UICollisionBehaviorDelegate>
@property (nonatomic,weak)UIView *redView;
@property (nonatomic,weak)UIView *blueView;
@property(nonatomic,strong)UIDynamicAnimator *animator;
@end

@implementation ViewController

#pragma mark -- UICollisionBehaviorDelegate


- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
    
    
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 {
    
}

// The identifier of a boundary created with translatesReferenceBoundsIntoBoundary or setTranslatesReferenceBoundsIntoBoundaryWithInsets is nil
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p {
    
    // 需要强转 identifier
    NSString *str = (NSString *)identifier;
    if ([str isEqualToString:@"key"]) {
        self.redView.backgroundColor = [UIColor yellowColor];
    } else {
        self.redView.backgroundColor = [UIColor redColor];
    }
    
    
}
- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier {
    
}


- (void)loadView {
    [super loadView];
    
    self.view = [[BGView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 注意点: 必须有一个全局的属性引用他,否则在方法执行完成,对象就会被释放了.会导致动画不能执行.
    // 根据一个范围创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 根据行为,创建对应的动力学对象
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    
    // 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView,self.blueView]];
    
    // 把引用的 view 的 bounds 变成边界和 redView 发生碰撞
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 添加边界
    // 方法1
        [collision addBoundaryWithIdentifier:@"key" fromPoint:CGPointMake(0, 200) toPoint:CGPointMake(120, 250)];
    
    // 方法2
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.blueView.frame];
    
    [collision addBoundaryWithIdentifier:@"key1" forPath:path];
    
    // action 实时监听
    collision.action = ^{
//        NSLog(@"%@",NSStringFromCGRect(self.redView.frame));
        BGView *bgview = (BGView *)self.view;
        bgview.redRect = self.redView.frame;
        
        [self.view setNeedsDisplay];
        
//        if (self.redView.frame.size.height > 105) {
//            self.redView.backgroundColor = [UIColor yellowColor];
//        } else {
//            self.redView.backgroundColor = [UIColor redColor];
//        }
    };
    
    collision.collisionDelegate = self;
    
    // 把行为添加到动画对象当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:redView];
    
    self.redView = redView;
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(170, self.view.bounds.size.height - 150, 50, 50);
    
    [self.view addSubview:blueView];
    
    self.blueView = blueView;
}

@end
