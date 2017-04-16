//
//  ZFBBusiness.m
//  001-支付宝口碑
//
//  Created by chao on 16/8/10.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBBusiness.h"

@implementation ZFBBusiness
+ (instancetype)businessWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
@end
