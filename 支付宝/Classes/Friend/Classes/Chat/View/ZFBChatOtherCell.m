//
//  ZFBChatOtherCell.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBChatOtherCell.h"
#import "Masonry.h"
#import "ZFBChat.h"

@interface ZFBChatOtherCell ()
@property (nonatomic, weak) UILabel *chatLabel;
@property (nonatomic, weak) UILabel *timeLabel;


@end
@implementation ZFBChatOtherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"123";
    timeLabel.font = [UIFont systemFontOfSize:10];
    timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:timeLabel];
    
    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.image = [UIImage imageNamed:@"APC_timeLineIcon"];
    [self.contentView addSubview:avatarView];
    
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.image = [UIImage imageNamed:@"Dialog_white.left"];
    [self.contentView addSubview:backgroundView];
    
    UILabel *chatLabel = [[UILabel alloc] init];
    chatLabel.numberOfLines = 0;
    chatLabel.font = [UIFont systemFontOfSize:14];
    chatLabel.textColor = [UIColor darkGrayColor];
    chatLabel.preferredMaxLayoutWidth = 200;

    [self.contentView addSubview:chatLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(8);
        make.centerX.equalTo(self.contentView);
    }];
    
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.top.equalTo(timeLabel.mas_bottom).offset(8);
        make.width.height.offset(40);
        
    }];
    
    [chatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatarView.mas_right).offset(16);
//        make.width.lessThanOrEqualTo(@200);
       

    }];
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatarView);
        make.edges.equalTo(chatLabel).mas_offset(UIEdgeInsetsMake(-8, -14, -8, -8));
       

    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.bottom.greaterThanOrEqualTo(avatarView);
        make.bottom.greaterThanOrEqualTo(backgroundView);

    }];
    
    self.timeLabel = timeLabel;
    self.chatLabel = chatLabel;
}

- (void)setChat:(ZFBChat *)chat {
    _chat = chat;
    
    self.chatLabel.text = chat.text;
    self.timeLabel.text = chat.time;
}
@end
