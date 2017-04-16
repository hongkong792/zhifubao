//
//  ZFBFunctionListFlowLayout.m
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFunctionListFlowLayout.h"

@implementation ZFBFunctionListFlowLayout


- (void)prepareLayout {
    [super prepareLayout];
    
    NSInteger count = 4;
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    CGFloat margin = 1;
    
    CGFloat itmeW = (size.width - (count - 1) * margin) / count;
    
    self.itemSize = CGSizeMake(itmeW, itmeW);
    self.minimumLineSpacing = margin;
    self.minimumInteritemSpacing = margin;
    
    
    self.sectionInset = UIEdgeInsetsMake(0, 0, 8, 0);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        
        if (attr.indexPath.section == 1) {
            // 修改宽度 == collectionView 的宽度
            CGRect rect = attr.frame;
            
            rect.size.width = self.collectionView.bounds.size.width;
            
            // 重新设置
            attr.frame = rect;
            
            // 修改完成，退出循环
            break;
        }
    }
    
    return attrs;
}
@end
