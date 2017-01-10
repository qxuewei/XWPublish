//
//  MShowAllGroup.m
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MShowAllGroup.h"
#import "MGroupCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "MImaLibTool.h"

@interface MShowAllGroup ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *arrGroup;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation MShowAllGroup

- (id)initWithArrGroup:(NSArray *)arrGroup arrSelected:(NSMutableArray *)arr {

    if (self = [super init]) {
        
        self.arrSeleted = arr;
        self.arrGroup = arrGroup;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 50;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:MGroupCellClassName bundle:nil] forCellReuseIdentifier:MGroupCellClassName];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(actionRightBar)];
    self.navigationItem.rightBarButtonItem = rightBar;
    // Do any additional setup after loading the view.
}


- (void)actionRightBar {

    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrGroup.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:MGroupCellClassName];
    ALAssetsGroup *froup = self.arrGroup[indexPath.row];
    cell.lblInfo.text = [NSString stringWithFormat:@"%@(%ld)",[froup valueForProperty:ALAssetsGroupPropertyName],[froup numberOfAssets]];
    cell.imavHead.image = [UIImage imageWithCGImage:froup.posterImage];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    if (!_mvc) {
//        _mvc = [[MShowGroupAllSet alloc] initWithGroup:self.arrGroup[indexPath.row] selectedArr:self.arrSeleted];
//        _mvc.delegate = self;
//    }
//    else{
//        _mvc.arrSelected = _arrSeleted;
//    }
    
    _mvc = [[MShowGroupAllSet alloc] initWithGroup:self.arrGroup[indexPath.row] selectedArr:self.arrSeleted];
    _mvc.delegate = self;
    _mvc.arrSelected = _arrSeleted;
    
    
    _mvc.MaxCount = _maxCout;
    [self.navigationController pushViewController:_mvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)finishSelectImg{
    [self.delegate finishSelectImg];
}

@end
