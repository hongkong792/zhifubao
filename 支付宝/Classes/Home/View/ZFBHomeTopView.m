//
//  ZFBHomeTopView.m
//  支付宝
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBHomeTopView.h"
#import "UIColor+Addition.h"
#import "ZFBHomeTopButton.h"
#import "Masonry.h"

@implementation ZFBHomeTopView

-(void)awakeFromNib {
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithHex:0x2e90d4];
    

    
    UIButton *scan = [self loadTopBtnWithTitle:@"扫一扫" andImageName:@"home_scan" andHomeBtnType:ZFBHomeTopViewBtnTypeScan];
   UIButton *pay =  [self loadTopBtnWithTitle:@"付款" andImageName:@"home_pay" andHomeBtnType:ZFBHomeTopViewBtnTypePay];
   UIButton *card =  [self loadTopBtnWithTitle:@"卡券" andImageName:@"home_card" andHomeBtnType:ZFBHomeTopViewBtnTypeCard];
   UIButton *xiu =  [self loadTopBtnWithTitle:@"咻一咻" andImageName:@"home_xiu" andHomeBtnType:ZFBHomeTopViewBtnTypeXiu];

    [scan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.equalTo(pay.mas_left).offset(0);
        make.width.equalTo(pay.mas_width).offset(0);
    }];
    
    [card mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pay.mas_right).offset(0);
        make.right.equalTo(xiu.mas_left).offset(0);
        make.width.equalTo(pay.mas_width).offset(0);

    }];
    
    [xiu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.width.equalTo(card.mas_width).offset(0);
    }];
   
}

- (UIButton *) loadTopBtnWithTitle:(NSString *)title andImageName:(NSString *)imageName andHomeBtnType:(ZFBHomeTopViewBtnType)btnType {
    ZFBHomeTopButton *topBtn = [[ZFBHomeTopButton alloc] init];
    [topBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [topBtn setTitle:title forState:UIControlStateNormal];

    topBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    topBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    topBtn.tag = btnType;
    
    [self addSubview:topBtn];
    
    [topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [topBtn addTarget:self action:@selector(homeTopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return topBtn;
}

- (void)homeTopBtnClick:(UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(homeTopView:didClickHomeTopBtnType:andTitle:)]) {
        [self.delegate homeTopView:self didClickHomeTopBtnType:btn.tag andTitle:btn.currentTitle];
    }
}
@end
