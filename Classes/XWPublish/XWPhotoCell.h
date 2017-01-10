//
//  XWPhotoCell.h
//  XWPublishDemo
//
//  Created by 邱学伟 on 16/4/15.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWPhotoCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@property(nonatomic,strong) UIImageView *BigImgView;

/** 查看大图 */
- (void)setBigImgViewWithImage:(UIImage *)img;


@end
