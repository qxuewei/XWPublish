//
//  MHeaderImaCell.m
//  QQImagePicker
//
//  Created by mark on 15/9/10.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MHeaderImaCell.h"

@implementation MHeaderImaCell
{
 
    MBoolBlock _actionBlock;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        self.clipsToBounds = YES;
        self.imavHead = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imavHead.clipsToBounds = YES;
        [self addSubview:self.imavHead];
        
        self.btnCheckMark = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnCheckMark.frame = CGRectMake(CGRectGetWidth(self.frame)-MHeaderImaCellBtn_width, 0, MHeaderImaCellBtn_width, MHeaderImaCellBtn_width);
        [self.btnCheckMark addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnCheckMark];
        
        [self.btnCheckMark setImage:[UIImage imageNamed:@"ico_check_select@2x.png"] forState:UIControlStateSelected];
        [self.btnCheckMark setImage:[UIImage imageNamed:@"ico_check_nomal@2x.png"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)actionBtn:(UIButton *)btn {

    btn.selected = !btn.selected;
    (!_actionBlock)?:_actionBlock(btn.selected);
}

- (void)setBtnSelectedActionBlock:(MBoolBlock)block {

    _actionBlock = block;
}

@end
