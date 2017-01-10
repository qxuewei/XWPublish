//
//  XWPhotoCell.m
//  XWPublishDemo
//
//  Created by 邱学伟 on 16/4/15.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import "XWPhotoCell.h"

@implementation XWPhotoCell

/** 查看大图 */
- (void)setBigImgViewWithImage:(UIImage *)img{
    if (_BigImgView) {
        //如果大图正在显示，还原小图
        _BigImgView.frame = _profilePhoto.frame;
        _BigImgView.image = img;
    }else{
        _BigImgView = [[UIImageView alloc] initWithImage:img];
        _BigImgView.frame = _profilePhoto.frame;
        [self insertSubview:_BigImgView atIndex:0];
    }
    _BigImgView.contentMode = UIViewContentModeScaleToFill;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
