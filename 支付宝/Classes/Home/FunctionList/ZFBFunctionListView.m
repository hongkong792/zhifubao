//
//  ZFBFunctionListView.m
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFunctionListView.h"
#import "ZFBFunctionListCell.h"
#import "ZFBFunctionListFlowLayout.h"
#import "ZFBFunctionADCell.h"
#import "Masonry.h"

@interface ZFBFunctionListView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end
#define KHomeTopFunctionCount  12
static NSString *listID = @"listID";
static NSString *ADID = @"ADID";

@implementation ZFBFunctionListView

-(void)awakeFromNib {
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    ZFBFunctionListFlowLayout *flowLayout = [[ZFBFunctionListFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self addSubview:collectionView];
    
    [collectionView registerClass:[ZFBFunctionListCell class] forCellWithReuseIdentifier:listID];
    
    [collectionView registerClass:[ZFBFunctionADCell class] forCellWithReuseIdentifier:ADID];

    collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return KHomeTopFunctionCount;
    } else if (section == 1) {
        return 1;
    } else {
        
        
        return _functionList.count - KHomeTopFunctionCount;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        ZFBFunctionADCell *adCell = [collectionView dequeueReusableCellWithReuseIdentifier:ADID forIndexPath:indexPath];
        adCell.backgroundColor = [UIColor purpleColor];
        return adCell;
    }
    
    ZFBFunctionListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listID forIndexPath:indexPath];
    NSInteger index = indexPath.item;
    
    if (indexPath.section == 2) {
        index = indexPath.item + KHomeTopFunctionCount;
        
    }
    cell.functionList = _functionList[index];
    return cell;
}
@end
