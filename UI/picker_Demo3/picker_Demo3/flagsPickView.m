//
//  flagsPickView.m
//  picker_Demo3
//
//  Created by jyh on 2018/2/9.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "flagsPickView.h"
#import "Flags.h"

@interface flagsPickView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *lblText;

@end

@implementation flagsPickView

- (void)setModel:(Flags *)model {
    _model = model;
    
    self.imageV.image = [UIImage imageNamed:model.icon];
    self.lblText.text = model.name;
    
}

+ (instancetype)flagsPickView {
    flagsPickView *flagView = [[NSBundle mainBundle] loadNibNamed:@"flagsPickView" owner:nil options:nil].lastObject;
    return flagView;
}


@end
