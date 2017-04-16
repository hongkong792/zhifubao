//
//  ZFBSlideCell.m
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBSlideCell.h"


@interface ZFBSlideCell ()
@property (nonatomic, weak) UIImageView *iconView;

@end
@implementation ZFBSlideCell

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
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:self.bounds];
    iconView.backgroundColor = [UIColor redColor];
//    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconView];
    _iconView = iconView;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    _iconView.image = [UIImage imageNamed:imageName];
}
@end
