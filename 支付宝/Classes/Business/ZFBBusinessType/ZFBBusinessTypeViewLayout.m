//
//  ZFBBusinessTypeViewLayout.m
//  02-商家分类
//
//  Created by HaoYoson on 16/6/25.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import "ZFBBusinessTypeViewLayout.h"

@implementation ZFBBusinessTypeViewLayout

- (void)prepareLayout {
    [super prepareLayout];

    CGSize size = self.collectionView.bounds.size;

    CGFloat w = size.width / 4;
    CGFloat h = size.height / 2;
    self.itemSize = CGSizeMake(w, h);

    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;

    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    // 设置 collectionView 的分页
    self.collectionView.pagingEnabled = YES;
    // 隐藏指示器
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
