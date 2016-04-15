//
//  XWPublishBaseController.h
//  XWPublishDemo
//
//  Created by 邱学伟 on 16/4/15.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "XWPhotoCell.h"
#import "JJPhotoManeger.h"
#import "XWImagePickerSheet.h"

@protocol XWPublishBaseViewDelegate <NSObject>

@optional

@end

@interface XWPublishBaseController : UIViewController

@property (nonatomic, assign) id<XWPublishBaseViewDelegate> delegate;

@property (nonatomic, strong) UICollectionView *pickerCollectionView;

@property (nonatomic, assign) CGFloat collectionFrameY;

//选择的图片数据
@property(nonatomic,strong) NSMutableArray *arrSelected;

//方形压缩图image 数组
@property(nonatomic,strong) NSMutableArray * imageArray;

//大图image 数组
@property(nonatomic,strong) NSMutableArray * bigImageArray;

//大图image 二进制
@property(nonatomic,strong) NSMutableArray * bigImgDataArray;

//图片选择器
@property(nonatomic,strong) UIViewController *showActionSheetViewController;

//collectionView所在view
@property(nonatomic,strong) UIView *showInView;

//图片总数量限制
@property(nonatomic,assign) NSInteger maxCount;


//初始化collectionView
- (void)initPickerView;
//修改collectionView的位置
- (void)updatePickerViewFrameY:(CGFloat)Y;
//获得collectionView 的 Frame
- (CGRect)getPickerViewFrame;

//获取选中的所有图片信息
- (NSArray*)getSmallImageArray;
- (NSArray*)getBigImageArray;
- (NSArray*)getALAssetArray;

- (void)pickerViewFrameChanged;

@end
