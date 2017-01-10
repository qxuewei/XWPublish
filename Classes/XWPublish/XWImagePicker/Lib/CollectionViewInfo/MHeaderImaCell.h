//
//  MHeaderImaCell.h
//  QQImagePicker
//
//  Created by mark on 15/9/10.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerDefine.h"
static NSString *const MHeaderImaCellClassName = @"MHeaderImaCell";
static float MHeaderImaCellBtn_x_space = 5;
static float MHeaderImaCellBtn_width = 40;
@interface MHeaderImaCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *btnCheckMark;
@property (nonatomic, strong) UIImageView *imavHead;
- (void)setBtnSelectedActionBlock:(MBoolBlock)block;
@end
