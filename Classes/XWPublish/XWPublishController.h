//
//  XWPublishController.h
//  XWPublishDemo
//
//  Created by 邱学伟 on 16/4/15.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWPublishBaseController.h"

@interface XWPublishController : XWPublishBaseController
/**
 *  取消按钮+监听方法
 */
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)cancelClick:(UIButton *)sender;
/**
 *  title文字  默认分享新鲜事可在xib修改
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLB;


//背景
@property(nonatomic,strong) UIView *noteTextBackgroudView;

//备注
@property(nonatomic,strong) UITextView *noteTextView;

//文字个数提示label
@property(nonatomic,strong) UILabel *textNumberLabel;

//文字说明
@property(nonatomic,strong) UILabel *explainLabel;

//发布按钮
@property(nonatomic,strong) UIButton *submitBtn;




@end
