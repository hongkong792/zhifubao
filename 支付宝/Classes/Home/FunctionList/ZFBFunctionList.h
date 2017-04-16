//
//  ZFBFunctionList.h
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFBFunctionList : UIView
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

+ (instancetype)functionListWithDict:(NSDictionary *)dict;
@end
