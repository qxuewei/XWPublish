//
//  MShowGroupAllSet.h
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "JJPhotoManeger.h"
@protocol MShowGroupAllSetDelegate<NSObject>
-(void)finishSelectImg;
@end

@interface MShowGroupAllSet : UIViewController<JJPhotoDelegate>
- (id)initWithGroup:(ALAssetsGroup *)group selectedArr:(NSMutableArray *)arrSelected;

@property(nonatomic,assign)NSInteger MaxCount;
@property(nonatomic,assign) id<MShowGroupAllSetDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *arrSelected;

@property(nonatomic,strong) NSMutableArray *imgViewArray;
@end
