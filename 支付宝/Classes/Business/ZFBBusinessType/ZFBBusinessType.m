//
//  ZFBBusinessType.m
//  02-商家分类
//
//  Created by HaoYoson on 16/6/25.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import "ZFBBusinessType.h"

@implementation ZFBBusinessType
+ (instancetype)businessTypeWithDict:(NSDictionary *)dict {
    ZFBBusinessType *b = [[self alloc] init];
    [b setValuesForKeysWithDictionary:dict];
    return b;
}
@end
