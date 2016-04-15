//
//  MGroupCell.h
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const MGroupCellClassName = @"MGroupCell";
@interface MGroupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imavHead;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
