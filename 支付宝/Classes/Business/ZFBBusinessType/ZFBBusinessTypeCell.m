//
//  ZFBBusinessTypeCell.m
//  02-商家分类
//
//  Created by HaoYoson on 16/6/25.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import "Masonry.h"
#import "ZFBBusinessTypeCell.h"

@interface ZFBBusinessTypeCell ()
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UILabel *nameLable;

@end

@implementation ZFBBusinessTypeCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setBusinessType:(ZFBBusinessType *)businessType {
    _businessType = businessType;

    self.iconView.image = [UIImage imageNamed:businessType.icon];
    self.nameLable.text = businessType.name;
}

- (void)setHighlighted:(BOOL)highlighted {
    

    // 通过设置背景颜色，显示高亮效果
    UIColor *color = highlighted ? [UIColor colorWithWhite:0.9 alpha:1.0] : [UIColor whiteColor];

    self.backgroundColor = color;
}

- (void)setupUI {
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"bus"];
    [self.contentView addSubview:iconView];

    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(27);
        make.centerX.equalTo(self.contentView);
        make.top.offset(18);
    }];

    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"美食";
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:nameLabel];

    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iconView);
        make.top.equalTo(iconView.mas_bottom).offset(8);
    }];

    self.iconView = iconView;
    self.nameLable = nameLabel;
}

@end
