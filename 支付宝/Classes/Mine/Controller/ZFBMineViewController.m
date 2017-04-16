//
//  ZFBMineViewController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMineViewController.h"
#import "ZFBMineFlowLayout.h"
#import "NSArray+Addition.h"
#import "ZFBMineOptionCell.h"
#import "UIColor+Addition.h"

#define KFirstSectionOptionCount 4
#define KSecondSectionOptionCount 4
#define KThirdSectionOptionCount 6

static NSString *mineInfoCellID = @"mine_info_cell";
static NSString *mineOptionCellID = @"mine_option_cell";
static NSString *mineBalanceCellID = @"mine_balance_cell";

@interface ZFBMineViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *mineOptionData;
@end

@implementation ZFBMineViewController
- (instancetype)init {
    ZFBMineFlowLayout *flowLayout = [[ZFBMineFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mineOptionData = [NSArray objectListWithPlistName:@"MineOption.plist" clsName:@"ZFBMineOption"];
    
    self.navigationItem.title = @"我";
    self.collectionView.backgroundColor = [UIColor colorWithHex:0xf5f5f9];

    
    UINib *infoCell = [UINib nibWithNibName:@"ZFBMineInfoCell" bundle:nil];
    UINib *optionCell = [UINib nibWithNibName:@"ZFBMineOptionCell" bundle:nil];
    UINib *balanceCell = [UINib nibWithNibName:@"ZFBMineBalanceCell" bundle:nil];
    [self.collectionView registerNib:infoCell forCellWithReuseIdentifier:mineInfoCellID];
    [self.collectionView registerNib:optionCell forCellWithReuseIdentifier:mineOptionCellID];
    [self.collectionView registerNib:balanceCell forCellWithReuseIdentifier:mineBalanceCellID];


    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return KFirstSectionOptionCount + 1;
        case 2:
            return KSecondSectionOptionCount;
        case 3:
            return KThirdSectionOptionCount;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:mineInfoCellID forIndexPath:indexPath];
    }
    
    if (indexPath.section == 1 && indexPath.item == 0) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:mineBalanceCellID forIndexPath:indexPath];
    }
    
    ZFBMineOptionCell *optionCell = [collectionView dequeueReusableCellWithReuseIdentifier:mineOptionCellID forIndexPath:indexPath];
    if (indexPath.section == 1) {
        optionCell.mineOption = self.mineOptionData[indexPath.item - 1];
    } else if (indexPath.section == 2) {
        optionCell.mineOption = self.mineOptionData[indexPath.item + KFirstSectionOptionCount];
    } else {
        optionCell.mineOption = self.mineOptionData[indexPath.item + KFirstSectionOptionCount + KSecondSectionOptionCount];
    }
    
    return optionCell;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(self.collectionView.bounds.size.width, 100);
    }
    
    if (indexPath.section == 1 && indexPath.item == 0) {
        return CGSizeMake(self.collectionView.bounds.size.width, 64);
    }
    ZFBMineFlowLayout *flowLayout = (ZFBMineFlowLayout *)collectionViewLayout;
    NSInteger count = 2;
    CGFloat w = (self.collectionView.bounds.size.width - (count - 1) * flowLayout.minimumInteritemSpacing) / count;
    CGFloat h = 64;
    return CGSizeMake(w, h);
    
}


@end
