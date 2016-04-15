//
//  MImaCell.h
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerDefine.h"

@protocol MImaCellDelegate

- (BOOL)arrayIsfulled;

@end

static NSString *MImaCellClassName = @"MImaCell";

@interface MImaCell : UICollectionViewCell

@property(nonatomic,assign) id<MImaCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imavHead;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckMark;


@property(nonatomic,strong) UIImageView *BigImgView;

- (void)setBtnSelectedHandle:(MBoolBlock)block;

- (void)setBigImgViewWithImage:(UIImage *)img;
@end
