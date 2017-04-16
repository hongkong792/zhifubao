//
//  ZFBFunctionADCell.m
//  01-功能列表
//
//  Created by chao on 16/8/16.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFunctionADCell.h"
#import "ZFBSlideView.h"

@implementation ZFBFunctionADCell
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
    ZFBSlideView *slideView = [[ZFBSlideView alloc] initWithFrame:self.bounds];
    slideView.imageNames = [self loadImageData];
    
    
    [self.contentView addSubview:slideView];
}

- (NSArray *)loadImageData {
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger i = 0; i < 5; i++) {
//        Home_Scroll_
        NSString *imageName = [NSString stringWithFormat:@"Home_Scroll_%02zd", i + 1];
        [arrM addObject: imageName];
    }
    return arrM.copy;
}
@end
