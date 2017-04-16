//
//  ZFBLevelView.m
//  001-支付宝口碑
//
//  Created by chao on 16/8/11.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBLevelView.h"
#define KStarTotalCount  5
@implementation ZFBLevelView


- (void)setLevel:(CGFloat)level {
    _level = level;
    
    NSInteger full_star = (NSInteger)level;
    for (NSInteger i = 0; i < full_star; i++) {
        // 加实星
        [self loadStarWithPosition:i starImageName:@"full_star"];
    }
    
    if (level - full_star) {
        // 加半星
        [self loadStarWithPosition:full_star starImageName:@"half_star"];
        
        full_star++;
    }
    
    for (NSInteger i = full_star; i < KStarTotalCount; i++) {
        // 加空星
        [self loadStarWithPosition:i starImageName:@"empty_star"];
        
    }
}


- (void)loadStarWithPosition:(NSInteger)position starImageName:(NSString *)imageName {
    UIImageView *starView = nil;
    if (self.subviews.count == 5) {
        starView = self.subviews[position];
        
    } else {
        starView = [[UIImageView alloc] init];
        CGRect starFrame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
        starView.frame = CGRectOffset(starFrame, position * self.bounds.size.height, 0);
        [self addSubview:starView];
    }
    starView.image = [UIImage imageNamed:imageName];
    
}
@end
