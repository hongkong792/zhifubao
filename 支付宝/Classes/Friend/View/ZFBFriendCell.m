//
//  ZFBFriendCell.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFriendCell.h"
#import "ZFBFriend.h"

@interface ZFBFriendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end
@implementation ZFBFriendCell

- (void)setFriendData:(ZFBFriend *)friendData {
    _friendData = friendData;
    
    self.iconView.image = [UIImage imageNamed:friendData.icon];
    self.titleView.text = friendData.title;
    self.subTitleView.text = friendData.subTitle;
    self.timeView.text = friendData.time;
}

@end
