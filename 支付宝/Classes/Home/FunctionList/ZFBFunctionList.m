//
//  ZFBFunctionList.m
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFunctionList.h"

@implementation ZFBFunctionList

+ (instancetype)functionListWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

@end
