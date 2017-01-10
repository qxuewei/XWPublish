//
//  MHeadImaView.h
//  QQImagePicker
//
//  Created by mark on 15/9/10.
//  Copyright (c) 2015年 mark. All rights reserved.
//  仿QQ照片选择器

#import <UIKit/UIKit.h>

typedef enum {

    headImaCheckMark = 1,
    headImaSelectBig = 2,
    headImaCheckCancel = 3
    
}headImaSelectType;

@protocol MHeadImaViewDelegate <NSObject>

- (void)selectIndex:(NSUInteger)index headImaSelectType:(headImaSelectType)type;

@end

@interface MHeadImaView : UIView

@property (nonatomic, weak) id<MHeadImaViewDelegate> delegate;
- (void)reloadDataWithArr:(NSArray *)arrData arrSelected:(NSMutableArray *)arrSelected;
@end
