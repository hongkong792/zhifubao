//
//  ZFBMineOptionCell.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMineOptionCell.h"
#import "ZFBMineOption.h"

@interface ZFBMineOptionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *messageView;

@end
@implementation ZFBMineOptionCell


- (void)setMineOption:(ZFBMineOption *)mineOption {
    _mineOption = mineOption;
    
    self.iconView.image = [UIImage imageNamed:mineOption.icon];
    self.nameView.text = mineOption.name;
    if ([mineOption.message isEqualToString:@"立即转入"]) {
        self.messageView.textColor = [UIColor blueColor];
    } else {
        self.messageView.textColor = [UIColor lightGrayColor];
    }
    self.messageView.text = mineOption.message;
}
@end
