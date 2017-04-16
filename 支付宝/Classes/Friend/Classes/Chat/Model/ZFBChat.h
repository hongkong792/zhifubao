//
//  ZFBChat.h
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ZFBChatTypeOther,
    ZFBChatTypeMe
} ZFBChatType;
@interface ZFBChat : NSObject
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) ZFBChatType type;
@end
