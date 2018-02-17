//
//  BGView.m
//  多点触摸事件
//
//  Created by jyh on 2018/2/15.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "BGView.h"

@interface BGView ()
@property(nonatomic,strong)NSArray *images;
@end

@implementation BGView

- (NSArray *)images {
    if (!_images) {
        _images = @[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"]];
    }
    return _images;
}


// 注意点: 必须打开 self.multipleTouchEnabled = YES; 或在 storyboard 里面勾选 multiple Touch

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self addSpark:touches];
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addSpark:touches];
}


- (void)addSpark:(NSSet *)touches {
    
    //    UITouch *t = touches.anyObject;
    int i = 0;
    for (UITouch *t in touches) {
        
        CGPoint p = [t locationInView:self];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:self.images[i]];
        
        image.center = p;
        
        [self addSubview:image];
        
        [UIView animateWithDuration:2 animations:^{
            image.alpha = 0;
        } completion:^(BOOL finished) {
            [image removeFromSuperview];
        }];
        i++;
    }
}
@end
