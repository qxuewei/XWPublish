//
//  SDDemoItemView.m
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDDemoItemView.h"

@implementation SDDemoItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setProgressViewClass:(Class)progressViewClass
{
    _progressViewClass = progressViewClass;
    self.progressView = [[progressViewClass alloc] init];
    [self addSubview:self.progressView];
}


+ (id)demoItemViewWithClass:(Class)class
{
    SDDemoItemView *demo = [[self alloc] init];
    demo.progressViewClass = class;
    return demo;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.progressView.frame = self.bounds;
}

@end
