//
//  MShowGroupAllSet.m
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MShowGroupAllSet.h"
#import "MImaLibTool.h"
#import "MImaCell.h"


//设置可添加图片最多个数!!!
#define kMaxImageCount 9

@interface MShowGroupAllSet ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MImaCellDelegate>
{
    NSMutableArray *newSelected;
    NSMutableArray *deleteImgs;

}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *arrData;

@end

@implementation MShowGroupAllSet

- (id)initWithGroup:(ALAssetsGroup *)group selectedArr:(NSMutableArray *)arrSelected {

    if (self = [super init]) {
        self.title = [group valueForProperty:ALAssetsGroupPropertyName];
        self.arrData = [[MImaLibTool shareMImaLibTool] getAllAssetsWithGroup:group];
        self.arrSelected = arrSelected;
        if (!newSelected) {
            newSelected = [NSMutableArray array];
        }
        if (!deleteImgs) {
            deleteImgs = [NSMutableArray array];
        }
        _imgViewArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowOut = [[UICollectionViewFlowLayout alloc] init];
    flowOut.sectionInset = UIEdgeInsetsZero;
    flowOut.minimumInteritemSpacing = 5;
    flowOut.minimumLineSpacing = 5;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowOut];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:MImaCellClassName bundle:nil] forCellWithReuseIdentifier:MImaCellClassName];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(actionRightBar)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    if (_MaxCount<=0) {
        //设置可添加图片最多个数
        _MaxCount = kMaxImageCount;
    }
    
    
    [self changeTitle];
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self changeTitle];
    [self.collectionView reloadData];
}


#pragma mark - 改变标题
- (void)changeTitle{
    NSString *title;
    if (self.arrSelected.count+newSelected.count>deleteImgs.count) {
        title = [NSString stringWithFormat:@"%lu/%d",(int)self.arrSelected.count+newSelected.count-deleteImgs.count,(int)_MaxCount];
    }
    else{
        title = [NSString stringWithFormat:@"0/%d",(int)_MaxCount];
    }
    self.title = title;
}

- (void)actionRightBar {
    
    [self.arrSelected addObjectsFromArray:newSelected];
    
    for (ALAsset *set in deleteImgs) {
        NSArray *arr = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:self.arrSelected set:set];
        if (arr > 0) {
            [self.arrSelected removeObject:[arr firstObject]];
        }
    }
    
    [newSelected removeAllObjects];
    [deleteImgs removeAllObjects];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate finishSelectImg];
    
    [_arrSelected removeAllObjects];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MImaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MImaCellClassName forIndexPath:indexPath];
    ALAsset *set = self.arrData[indexPath.row];
    
    cell.imavHead.image = [UIImage imageWithCGImage:set.thumbnail];
    
    if (([[MImaLibTool shareMImaLibTool] imaInArrImasWithArr:self.arrSelected set:set]||[[MImaLibTool shareMImaLibTool] imaInArrImasWithArr:newSelected set:set])&&![[MImaLibTool shareMImaLibTool] imaInArrImasWithArr:deleteImgs set:set]) {
        cell.btnCheckMark.selected = YES;
    }
    else{
        cell.btnCheckMark.selected = NO;
    }

    [cell setBtnSelectedHandle:^(BOOL state) {
        
        if (state) {
            
            if (deleteImgs.count>0) {
                NSArray *arr = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:deleteImgs set:set];
                if (arr.count > 0) {
                    [deleteImgs removeObject:set];
                }
            }
            
            NSArray *arr1 = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:self.arrSelected set:set];
            NSArray *arr2 = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:newSelected set:set];
            if (arr1.count <= 0 && arr2.count <= 0) {
                [newSelected addObject:set];
            }
            
            
        } else {
           
            NSArray *arr = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:self.arrSelected set:set];
            NSArray *arr1 = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:deleteImgs set:set];
            if (arr.count > 0 && arr1.count <= 0) {
                [deleteImgs addObject:set];
            }
            
            if (newSelected.count>0) {
                NSArray *arr2 = [[MImaLibTool shareMImaLibTool] checkMarkSameSetWithArr:newSelected set:set];
                if (arr2.count>0) {
                    [newSelected removeObject:set];
                }
            }
            
        }
        
        [self changeTitle];
        
    }];
    
    cell.delegate = self;
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //点击放大查看
    
    MImaCell *cell = (MImaCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (!cell.BigImgView || !cell.BigImgView.image) {
        ALAsset *set = self.arrData[indexPath.row];
        [cell setBigImgViewWithImage:[self getBigIamgeWithALAsset:set]];
    }
    
    JJPhotoManeger *mg = [JJPhotoManeger maneger];
    mg.delegate = self;
    [mg showLocalPhotoViewer:@[cell.BigImgView] selecImageindex:0];
}

- (UIImage*)getBigIamgeWithALAsset:(ALAsset*)set{
    //压缩
    // 需传入方向和缩放比例，否则方向和尺寸都不对
    UIImage *img = [UIImage imageWithCGImage:set.defaultRepresentation.fullResolutionImage
                                       scale:set.defaultRepresentation.scale
                                 orientation:(UIImageOrientation)set.defaultRepresentation.orientation];
    NSData *imageData = UIImageJPEGRepresentation(img, 1.0);
    
    return [UIImage imageWithData:imageData];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    float wid = CGRectGetWidth(self.collectionView.bounds);
    return CGSizeMake((wid-3*5)/4, (wid-3*5)/4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - MImaCellDelegate (是否已经满了上限)
- (BOOL)arrayIsfulled{
    
    if (self.arrSelected.count+newSelected.count>=deleteImgs.count + _MaxCount) {
        return YES;
    }
    return NO;
}

-(void)photoViwerWilldealloc:(NSInteger)selecedImageViewIndex
{
    NSLog(@"最后一张观看的图片的index是:%zd",selecedImageViewIndex);
}
@end
