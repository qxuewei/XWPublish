//
//  MHeadImaView.m
//  QQImagePicker
//
//  Created by mark on 15/9/10.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MHeadImaView.h"
#import "MFlowLayOut.h"
#import "MHeaderImaCell.h"
#import "MImaLibTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface MHeadImaView () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *arrData;
@property (nonatomic, strong) NSMutableArray *arrSelected;
@end

@implementation MHeadImaView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        MFlowLayOut *flowLayout = [[MFlowLayOut alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[MHeaderImaCell class] forCellWithReuseIdentifier:MHeaderImaCellClassName];
       
    }
    return self;
}

- (void)reloadDataWithArr:(NSArray *)arrData arrSelected:(NSMutableArray *)arrSelected{

    self.arrSelected = arrSelected;
    self.arrData = arrData;
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView reloadData];
    
    
}

- (CGSize)getImaSizeWithAsset:(ALAsset *)set {

    CGSize imaSize ;
    ALAssetRepresentation *sentation = [set defaultRepresentation];
    float scale = sentation.dimensions.width/sentation.dimensions.height;
    imaSize.width = floor(180*scale);
    imaSize.height = 180;
    return imaSize;
}

#pragma mark - collectionViewDatasourceAndDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MHeaderImaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MHeaderImaCellClassName forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    ALAsset *set = self.arrData[indexPath.row];
    ALAssetRepresentation *sentation = [set defaultRepresentation];
    cell.imavHead.image = [UIImage imageWithCGImage:[sentation fullScreenImage]];
    cell.btnCheckMark.selected = [[MImaLibTool shareMImaLibTool] imaInArrImasWithArr:self.arrSelected set:set];
    __weak typeof(self) weakSelf = self;
    [cell setBtnSelectedActionBlock:^(BOOL state) {
        
        if (state) {
            [weakSelf.arrSelected addObject:set];
        } else {
            [weakSelf.arrSelected removeObject:set];
        }
        if ([weakSelf.delegate respondsToSelector:@selector(selectIndex:headImaSelectType:)]) {
            [weakSelf.delegate selectIndex:indexPath.row headImaSelectType:(state)?headImaCheckMark:headImaCheckCancel];
        }
        
    }];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(selectIndex:headImaSelectType:)]) {
        [self.delegate selectIndex:indexPath.row headImaSelectType:headImaSelectBig];
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (self.arrData.count > 0) {
     return [self getImaSizeWithAsset:self.arrData[indexPath.row]];
    }

    return CGSizeZero;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
