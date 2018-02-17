//
//  ViewController.m
//  愤怒的小方块
//
//  Created by jyh on 2018/2/17.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>
@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UIGravityBehavior *gravity;
@property (nonatomic,weak)UIView *blueView;
@end

@implementation ViewController

struct YHValue {
    CGFloat startValue;
    CGFloat endValue;
};
typedef struct YHValue YHValue;

static inline YHValue
YHValueMake(CGFloat startValue, CGFloat endValue) {
    YHValue value;
    value.startValue = startValue;
    value.endValue = endValue;
    return value;
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
    
    // 添加重力
    [self.gravity addItem:self.blueView];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    
    // 获取移动的偏移量
    CGPoint offset = [sender translationInView:sender.view];
    
    // 当前手指的位置
    CGPoint currentPoint = [sender locationInView:self.view];
    
    // 计算最后的偏移量
    CGFloat offsetX = sender.view.center.x - currentPoint.x;
    CGFloat offsetY = sender.view.center.y - currentPoint.y;
    
    // 计算拖动距离 : sqrt 开平方
    CGFloat distance = sqrt(offsetX * offsetX + offsetY * offsetY);
    
    // 绘制一个范围
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, sender.view.center.x, sender.view.center.y, 100, 0, 2 * M_PI, 1);
    if (CGPathContainsPoint(path, NULL, currentPoint, NO)) {
        if (sender.state == UIGestureRecognizerStateEnded) {
            // 添加重力
            UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[sender.view]];
            self.gravity = gravity;
            [self.animator addBehavior:gravity];
            // 添加推力
            UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[sender.view] mode:(UIPushBehaviorModeInstantaneous)];
            // 设置方向
            push.pushDirection = CGVectorMake(offsetX, offsetY);
            
            // 设置量级
            push.magnitude = [self resultWithConsult:distance abdResultValue:(YHValueMake(0, 1)) andConsultvalue:(YHValueMake(0, 100))];
            
            [self.animator addBehavior:push];
            
            
            
        }
    } else {
        return;
    }
    
    // 改变红色 view 的 transform
    sender.view.transform = CGAffineTransformTranslate(sender.view.transform, offset.x, offset.y);
    
    // transform 归 0
    [sender setTranslation:CGPointZero inView:sender.view];
    
}


/**
 根据参考获取结果
 一元一次方程
 @param consule 参考值
 @param resultValue 结果的 start 到 end
 @param consultValue 参考的 start 到 end
 @return  结果值
 */
- (CGFloat)resultWithConsult:(CGFloat)consule abdResultValue:(YHValue)resultValue andConsultvalue:(YHValue)consultValue {
    
    CGFloat a = (resultValue.startValue - resultValue.endValue) / (consultValue.startValue - consultValue.endValue);
    CGFloat b = resultValue.startValue - (a * consultValue.startValue);
    
    return a * consule + b;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(150, 250, 30, 30);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [redView addGestureRecognizer:pan];
    
    
    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(500, 300, 30, 30);
    blueView.backgroundColor = [UIColor blueColor];
    self.blueView = blueView;
    [self.view addSubview:blueView];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[redView,blueView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionDelegate = self;
    [self.animator addBehavior:collision];
}


@end
