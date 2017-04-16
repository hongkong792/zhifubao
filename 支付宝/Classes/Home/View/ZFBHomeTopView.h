//
//  ZFBHomeTopView.h
//  支付宝
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFBHomeTopView;

typedef enum : NSUInteger {
    ZFBHomeTopViewBtnTypeScan,
    ZFBHomeTopViewBtnTypePay,
    ZFBHomeTopViewBtnTypeCard,
    ZFBHomeTopViewBtnTypeXiu
} ZFBHomeTopViewBtnType;

@protocol ZFBHomeTopViewDelegate <NSObject>

@optional
- (void)homeTopView:(ZFBHomeTopView *)homeTopView didClickHomeTopBtnType:(ZFBHomeTopViewBtnType)btnType andTitle:(NSString *)title;

@end
@interface ZFBHomeTopView : UIView
@property (nonatomic, weak) id<ZFBHomeTopViewDelegate> delegate;

@end
