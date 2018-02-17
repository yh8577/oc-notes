//
//  QDView.m
//  手势解锁
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "QDView.h"

#define KButoonCount 9
@interface QDView ()
@property (weak, nonatomic) IBOutlet UIImageView  *topPassword;

@property(nonatomic,strong)NSMutableArray *btns;
@property(nonatomic,strong)NSMutableArray *lineBtns;
@property(nonatomic,assign)CGPoint currentPoint;
@end
@implementation QDView

- (NSMutableArray *)lineBtns {
    if (!_lineBtns) {
        _lineBtns = [NSMutableArray array];
    }
    return _lineBtns;
}

- (NSMutableArray *)btns {
    if (!_btns) {
        _btns = [NSMutableArray array];
        for (int i = 0; i < KButoonCount; i++) {
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
            [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:(UIControlStateNormal)];
            [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:(UIControlStateHighlighted)];
            [btn setImage:[UIImage imageNamed:@"gesture_node_error"] forState:(UIControlStateDisabled)];
            [btn setUserInteractionEnabled:NO];
            [self addSubview:btn];
            [_btns addObject:btn];
        }
    }
    return _btns;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn = self.btns[i];
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.highlighted = YES;
            [self.lineBtns addObject:btn];
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    self.currentPoint = p;
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn  = self.btns[i];
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.highlighted = YES;
            if (![self.lineBtns containsObject:btn]) {
                [self.lineBtns addObject:btn];
            }
        }
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.currentPoint = [[self.lineBtns lastObject] center];
    [self setNeedsDisplay];
    NSString *password = @"";
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *btn  = self.lineBtns[i];
        password = [password stringByAppendingString:[NSString stringWithFormat:@"%ld",btn.tag + 1]];
    }
    if (self.passwordBlock) {
        if (self.passwordBlock(password)) {
            for (int i = 0; i < self.lineBtns.count; i++) {
                UIButton *btn  = self.lineBtns[i];
                btn.highlighted = YES;
            }
        } else {
            for (int i = 0; i < self.lineBtns.count; i++) {
                UIButton *btn  = self.lineBtns[i];
                btn.highlighted = NO;
                btn.enabled = NO;
            }
        }
    }
    [self setUserInteractionEnabled:NO];
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.topPassword.image = image;
    [self setUserInteractionEnabled:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self clear];
    });
}

- (void)clear {
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn  = self.btns[i];
        btn.highlighted = NO;
        btn.enabled = YES;
    }
    [self.lineBtns removeAllObjects];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (!self.lineBtns.count) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i <self.lineBtns.count; i++) {
        UIButton *btn  = self.lineBtns[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [[UIColor whiteColor] set];
    [path setLineWidth:10];
    [path setLineJoinStyle:(kCGLineJoinRound)];
    [path setLineCapStyle:(kCGLineCapRound)];
    [path stroke];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = 74;
    CGFloat h = w;
    int colCount = 3;
    CGFloat margin = (self.frame.size.width - colCount * w) / 4;
    for (int i = 0; i < self.btns.count; i++) {
        CGFloat x = (i % colCount) * (margin + w) + margin;
        CGFloat y = (i / colCount) * (margin + h) + margin;
        [self.btns[i] setFrame:CGRectMake(x, y, w, h)];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.topPassword.image = image;
}
@end
