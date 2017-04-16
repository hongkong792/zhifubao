//
//  ZFBBusinessCell.m
//  001-支付宝口碑
//
//  Created by chao on 16/8/10.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBBusinessCell.h"
#import "ZFBBusiness.h"
#import "ZFBLevelView.h"

@interface ZFBBusinessCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *offNumView;
@property (weak, nonatomic) IBOutlet UILabel *levelNum;
@property (weak, nonatomic) IBOutlet UILabel *averagePriceView;
@property (weak, nonatomic) IBOutlet UILabel *distanceView;
@property (weak, nonatomic) IBOutlet UILabel *discountView;
@property (weak, nonatomic) IBOutlet ZFBLevelView *levelView;
@property (weak, nonatomic) IBOutlet UILabel *minus;

@end
@implementation ZFBBusinessCell


- (void)setBusiness:(ZFBBusiness *)business {
    _business = business;
    
    self.iconView.image = [UIImage imageNamed:business.icon];
    self.nameView.text = business.name;
    self.offNumView.text = [NSString stringWithFormat:@"%@折", @(business.offNum).description];
    
    self.levelNum.text = @(business.level).description;
    self.averagePriceView.text = [NSString stringWithFormat:@"人均消息%@元", business.averagePrice];
    self.distanceView.text = [NSString stringWithFormat:@"距离%@m", business.distance];
    self.discountView.text = business.discount;
    

    
    self.levelView.level = business.level;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.minus.backgroundColor = [UIColor orangeColor];
}

@end
