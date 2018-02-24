//
//  UIImageView+myImageView.m
//  关联对象
//
//  Created by jyh on 2018/2/24.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "UIImageView+myImageView.h"
// 运行时类
#import <objc/runtime.h>
// 可以在运行期间给某个对象增加属性
// 可以在运行的期间获取某个类的对象的所有属性名称
// 交互方法
@implementation UIImageView (myImageView)
- (NSString *)urlString {
    return objc_getAssociatedObject(self, "str");
}

- (void)setUrlString:(NSString *)urlString {
    // 关联对象
    // 可以在运行期间给某个对象增加属性
    objc_setAssociatedObject(self, "str", urlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
