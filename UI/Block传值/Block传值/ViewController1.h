//
//  ViewController1.h
//  Block传值
//
//  Created by jyh on 2018/2/13.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController1 : UIViewController
@property(nonatomic,copy)void(^strBlock)(NSString *) ;
@property(nonatomic,copy)NSString *strText;
@end
