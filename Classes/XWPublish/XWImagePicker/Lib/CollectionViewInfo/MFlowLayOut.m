//
//  MFlowLayOut.m
//  QQImagePicker
//
//  Created by mark on 15/9/10.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MFlowLayOut.h"
#import "MHeaderImaCell.h"
@implementation MFlowLayOut

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
    
    for (UICollectionViewLayoutAttributes *att in arr) {
        if (att.representedElementCategory == UICollectionElementCategoryCell) {
            MHeaderImaCell *cell = (MHeaderImaCell *)[self.collectionView cellForItemAtIndexPath:att.indexPath];
            
            float offSet_x = fabs(self.collectionView.contentOffset.x - (att.frame.origin.x - CGRectGetWidth(self.collectionView.frame)));
            CGRect cellRect  = cell.btnCheckMark.frame;
            cellRect.origin.x = MIN(offSet_x>MHeaderImaCellBtn_width?offSet_x-MHeaderImaCellBtn_width:0, fabs(CGRectGetWidth(att.frame) - CGRectGetWidth(cell.btnCheckMark.frame)));
            cell.btnCheckMark.frame = cellRect;

        }
    }
    
    return arr;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {

    return YES;
}

@end
