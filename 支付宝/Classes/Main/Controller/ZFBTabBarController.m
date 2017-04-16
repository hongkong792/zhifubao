//
//  ZFBTabBarController.m
//  支付宝
//
//  Created by chao on 16/7/28.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBTabBarController.h"
#import "ZFBNavigationController.h"
#import "UIColor+Addition.h"

@interface ZFBTabBarController ()

@end

@implementation ZFBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置主题颜色"标题文字颜色"
    [self.tabBar setTintColor:[UIColor colorWithHex:0x2e90d4]];
    
    UIViewController *home = [self loadChildViewControllerWithClassName:@"ZFBHomeViewController" andTitle:@"支付宝" andImageName:@"TabBar_HomeBar"];
    
    UIViewController *business = [self loadChildViewControllerWithStoryboardName:@"ZFBBusiness" andTitle:@"口碑" andImageName:@"TabBar_Businesses"];
    
    UIViewController *friend = [self loadChildViewControllerWithClassName:@"ZFBFriendViewController" andTitle:@"朋友" andImageName:@"TabBar_Friends"];
    
    UIViewController *mine = [self loadChildViewControllerWithClassName:@"ZFBMineViewController" andTitle:@"我的" andImageName:@"TabBar_Assets"];
    
    
    self.viewControllers = @[home, business, friend, mine];
    
//    self.selectedIndex = 1;
}



- (UIViewController *)loadChildViewControllerWithStoryboardName:(NSString *)sbName andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    
    return [self setupTabBarItemAndNavigationControllerWithRootViewController:vc andTitle:title andImageName:imageName];
}

- (UIViewController *)loadChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    Class class = NSClassFromString(className);
    
    UIViewController *vc = [[class alloc] init];
    
    return [self setupTabBarItemAndNavigationControllerWithRootViewController:vc andTitle:title andImageName:imageName];
}


- (UIViewController *)setupTabBarItemAndNavigationControllerWithRootViewController:(UIViewController *)viewController andTitle:(NSString *)title andImageName:(NSString *)imageName {
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_Sel", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZFBNavigationController *nav = [[ZFBNavigationController alloc] initWithRootViewController:viewController];
    return nav;
}
@end
