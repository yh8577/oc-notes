//
//  EditController.h
//  通信录Demo
//
//  Created by jyh on 2018/2/12.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tel,EditController;
//@protocol EditControllerDelegate<NSObject>
//- (void)editController:(EditController*)editController;
//@end

@interface EditController : UIViewController
//@property (nonatomic, weak) id<EditControllerDelegate> delegate;

@property(nonatomic,strong)Tel *tel;

@end
