//
//  ZFBBusinessType.h
//  02-商家分类
//
//  Created by HaoYoson on 16/6/25.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBBusinessType : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;

+(instancetype)businessTypeWithDict:(NSDictionary *)dict;
@end
