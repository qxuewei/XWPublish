//
//  MImaLibTool.h
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void (^arrBlock)(NSArray *arrObj);
@interface MImaLibTool : NSObject
+ (id)shareMImaLibTool;


- (void)getAllGroupWithArrObj:(arrBlock)block;
- (NSArray *)getAllAssetsWithGroup:(ALAssetsGroup *)group;
//- (void)getAllAssetsWithGroup:(ALAssetsGroup *)group finishBlock:(arrBlock)block;

- (BOOL)imaInArrImasWithArr:(NSArray *)arrIma set:(ALAsset *)set;
- (NSArray *)checkMarkSameSetWithArr:(NSArray *)arrSelected set:(ALAsset *)set;

@property (nonatomic, strong) ALAssetsLibrary *lib;

@end
