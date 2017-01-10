//
//  XWImagePickerSheet.h
//  XWPublishDemo
//
//  Created by 邱学伟 on 16/4/15.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MHeadImaView.h"
#import "MImaLibTool.h"
#import "MShowAllGroup.h"

typedef enum {
    selectSend = 1,
    selectedCancel = 2,
    selectedCamera = 3,
    selectPhotoLib = 4
}menuSelectedType;

//定义选择的block方法
typedef void (^menuSelectBlock)(id obj, menuSelectedType type);

//协议
@protocol XWImagePickerSheetDelegate <NSObject>

@optional
/**
 *  相册完成选择得到图片
 */
-(void)getSelectImageWithALAssetArray:(NSArray *)ALAssetArray thumbnailImageArray:(NSArray *)thumbnailImgArray;

@end

@interface XWImagePickerSheet : NSObject<UIImagePickerControllerDelegate,UIActionSheetDelegate,MShowAllGroupDelegate>{
    UIImagePickerController *imaPic;
    UIViewController *viewController;
}
//代理
@property (nonatomic, assign) id<XWImagePickerSheetDelegate> delegate;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *arrTitles;
@property (nonatomic, copy) menuSelectBlock menuBlock;
@property (nonatomic, strong) NSArray *arrGroup;
@property (nonatomic, strong) NSMutableArray *arrSelected;
@property (nonatomic, assign) NSInteger maxCount;
//显示选择照片提示sheet
-(void)showImgPickerActionSheetInView:(UIViewController *)controller;

@end
