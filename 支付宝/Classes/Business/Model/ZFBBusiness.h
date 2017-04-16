//
//  ZFBBusiness.h
//  001-支付宝口碑
//
//  Created by chao on 16/8/10.
//  Copyright © 2016年 chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFBBusiness : NSObject
/**
 *  配图
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  店名
 */
@property (nonatomic, copy) NSString *name;
/**
 *  优惠信息
 */
@property (nonatomic, copy) NSString *discount;
/**
 *  人均消费
 */
@property (nonatomic, strong) NSNumber *averagePrice;
/**
 *  距离
 */
@property (nonatomic, strong) NSNumber *distance;
/**
 *  打折
 */
@property (nonatomic, assign) float offNum;
/**
 *  评分
 */
@property (nonatomic, assign) CGFloat level;

+ (instancetype)businessWithDict:(NSDictionary *)dict;
@end
