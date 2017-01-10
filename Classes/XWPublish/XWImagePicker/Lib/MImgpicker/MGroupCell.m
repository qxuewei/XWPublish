//
//  MGroupCell.m
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MGroupCell.h"

@implementation MGroupCell

- (void)awakeFromNib {
    // Initialization code
//    self.lblInfo.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] > 8.0){
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
    self.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
