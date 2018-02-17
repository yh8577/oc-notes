//
//  YHRotateView.m
//  大转盘
//
//  Created by jyh on 2018/2/18.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHRotateView.h"
#import "YHAlertController.h"
@interface YHRotateView ()
@property (weak, nonatomic) IBOutlet UIImageView *rotateImage;
@property (nonatomic,weak)UIButton *currentButton;
@property(nonatomic,strong)CADisplayLink *link;
@end
@implementation YHRotateView

+ (instancetype)rotateView {
    return [[[NSBundle mainBundle] loadNibNamed:@"YHRotateView" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    for (int i = 0; i < 12; i++) {
        UIButton *btn = [[UIButton alloc] init];
        // 设置btn 的 tag 方便计算旋转角度
        btn.tag = i;
        // 获取图片
        UIImage *image = [UIImage imageNamed:@"LuckyAstrology"];
        // 裁剪图片
        image = [self clipImageWithImage:image withIndex:i];
        // 设置图片
        [btn setImage:image forState:(UIControlStateNormal)];
        
        // 获取图片
        UIImage *imagePress = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        // 裁剪图片
        imagePress = [self clipImageWithImage:imagePress withIndex:i];
        // 设置图片
        [btn setImage:imagePress forState:(UIControlStateSelected)];
        
        // 设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:(UIControlStateSelected)];
        
        // 设置 btn imageView 往上偏移
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-50, 0, 0, 0)];
        
        [self.rotateImage addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
}

// 开始选号
- (IBAction)pickNumber:(UIButton *)sender {
 
    // 核心动画存在直接不执行以下代码
    if ([self.rotateImage.layer animationForKey:@"key"]) {
        return;
    }
    
    // 停止自旋转
    self.link.paused = YES;
    // 核心动画
    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
    // 动画类型
    anim.keyPath = @"transform.rotation";
    
    // 计算需要减去的角度
    CGFloat angle = 2 * M_PI / 12 * self.currentButton.tag;
    
    // 旋转圈数
    anim.toValue = @(5 * M_PI * 2 - angle);
    
    // 不回到原来的位置
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    // 设置时间
    anim.duration = 3;
    
    // 添加动画到 imageview 上
    [self.rotateImage.layer addAnimation:anim forKey:@"key"];

    // 动画执行完成后把按钮移动到停止的位置
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(anim.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.rotateImage.transform = CGAffineTransformMakeRotation(-angle);
        YHAlertController *alert = [YHAlertController presentOkayWithTitle:@"选中" message:@"1,2,3,4,5,6"];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
            self.link.paused = NO;
        }];
        
        [alert addAction:ok];
       
        [self.rotateImage.layer removeAnimationForKey:@"key"];
        
    });
}


// 旋转定时器
- (void)startRotate{
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;

}

// 旋转
- (void)rotate {
    
    // 2 * M_PI 1秒转60圈
    // 2 * M_PI / 60 1秒转1圈
    // 2 * M_PI / 60 / 10 10秒转1圈
    
    self.rotateImage.transform = CGAffineTransformRotate(self.rotateImage.transform, 2 * M_PI / 60 / 10);
    
}

- (void)btnClick:(UIButton *)sender {
    
    // 取消选中状态
    self.currentButton.selected = NO;
    
    // 设置 btn 选中状态
    sender.selected = YES;
    
    // 记录选中的 btn
    self.currentButton = sender;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 注意点: 如果是自己自定义的 view 使用 subviews 没有关系.系统的慎用.因为系统的 View 有可能会添加其他的控件.
    for (int i = 0; i < self.rotateImage.subviews.count; i++) {
        UIButton *btn  = self.rotateImage.subviews[i];
        // 注意点: 设置center必须在设置 frame 之后,bounds不需要
        // 因为这里还没有获取的 self.center .因为控件还没有创建出来.所以不能直接使用 self 获取
        btn.center = self.rotateImage.center;
        btn.bounds = CGRectMake(0, 0, 68, 143);
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        
        // 计算夹角
        CGFloat angle = 2 * M_PI / 12;
        
        // 修改 btn 的 transform
        btn.transform = CGAffineTransformMakeRotation(angle * i);
    }
}

// 根据大图切割小图
- (UIImage *)clipImageWithImage:(UIImage *)image withIndex:(NSInteger)index {
    // 注意点: 这里需要乘上屏幕的缩放因子,才能适配不同屏幕 * [UIScreen mainScreen].scale
    CGFloat w = image.size.width / 12 * [UIScreen mainScreen].scale;
    CGFloat h = image.size.height * [UIScreen mainScreen].scale;
    CGFloat x = index * w;
    CGFloat y = 0;
    
    CGImageRef imageRef =  CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, w, h));
    
    UIImage *newImage = [UIImage imageWithCGImage:imageRef scale:2.3 orientation:(UIImageOrientationUp)];
    
    CFRelease(imageRef);
    
    return newImage;
}

@end
