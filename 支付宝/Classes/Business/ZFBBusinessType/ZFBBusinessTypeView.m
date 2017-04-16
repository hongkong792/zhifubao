//
//  ZFBBusinessTypeView.m
//  02-商家分类
//
//  Created by HaoYoson on 16/6/25.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import "Masonry.h"
#import "ZFBBusinessTypeCell.h"
#import "ZFBBusinessTypeView.h"
#import "ZFBBusinessTypeViewLayout.h"

static NSString* cellid = @"type_cell";

@interface ZFBBusinessTypeView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UIPageControl* pageControl;

@end

@implementation ZFBBusinessTypeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupUI];
}

- (void)setupUI
{
    ZFBBusinessTypeViewLayout* layout = [[ZFBBusinessTypeViewLayout alloc] init];

    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];

    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self addSubview:collectionView];

    [collectionView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.left.right.offset(0);
        make.bottom.offset(-30);

    }];

    // 注册单元格
    [collectionView registerClass:[ZFBBusinessTypeCell class] forCellWithReuseIdentifier:cellid];

    // 分页控件
    UIPageControl* pageControl = [[UIPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:.9 alpha:1];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithWhite:.6 alpha:1];
    [self addSubview:pageControl];
    pageControl.numberOfPages = 2;

    [pageControl mas_makeConstraints:^(MASConstraintMaker* make) {
        make.centerX.equalTo(self);
        make.top.equalTo(collectionView.mas_bottom).offset(-8);
    }];

    self.pageControl = pageControl;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.typeList.count;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    ZFBBusinessTypeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];

    //        cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];

    cell.businessType = self.typeList[indexPath.row];

    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat page = scrollView.contentOffset.x / self.bounds.size.width;
    NSInteger pageNo = page + 0.4999;
    self.pageControl.currentPage = pageNo;
}

@end
