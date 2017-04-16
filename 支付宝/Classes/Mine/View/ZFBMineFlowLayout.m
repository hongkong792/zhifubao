//
//  ZFBMineFlowLayout.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMineFlowLayout.h"

@implementation ZFBMineFlowLayout

- (void)prepareLayout {
    self.minimumInteritemSpacing = 1;
    self.minimumLineSpacing = 1;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 16, 0);
}
@end
