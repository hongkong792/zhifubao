//
//  ZFBBusinesHeaderView.m
//  001-支付宝口碑
//
//  Created by chao on 16/8/11.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBBusinessHeaderView.h"

@implementation ZFBBusinessHeaderView

+ (instancetype)businesHeaderView {
    UINib *nib = [UINib nibWithNibName:@"ZFBBusinessHeaderView" bundle:nil];
   ZFBBusinessHeaderView *headerView = [[nib instantiateWithOwner:nil options:nil] firstObject];
    
   
    return headerView;
}

@end
