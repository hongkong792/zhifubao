//
//  ZFBNavigationController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBNavigationController.h"
#import "UIColor+Addition.h"
@interface ZFBNavigationController ()

@end

@implementation ZFBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 清空导航条背景图片
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
//
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [self.navigationBar setBarTintColor:[UIColor colorWithHex:0x2e90d4]];
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
//
    

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


//- (UIViewController *)childViewControllerForStatusBarStyle {
//    return self.topViewController;
//}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
