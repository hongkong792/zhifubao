//
//  ZFBHomeViewController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBHomeViewController.h"
#import "ZFBHomeTopView.h"
#import "Masonry.h"
#import "ZFBFunctionListView.h"
#import "ZFBFunctionList.h"

@interface ZFBHomeViewController ()<ZFBHomeTopViewDelegate>

@end

@implementation ZFBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    ZFBHomeTopView *homeTopView = [[ZFBHomeTopView alloc] init];
    homeTopView.delegate = self;
    [self.view addSubview:homeTopView];
    
    
    ZFBFunctionListView *homeFunctionListView = [[ZFBFunctionListView alloc] init];
    homeFunctionListView.functionList = [self loadFunctionListData];
    homeFunctionListView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:homeFunctionListView];
    
    [homeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(115);
    }];
    
    
    [homeFunctionListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(homeTopView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(-49);
    }];
}

- (void)homeTopView:(ZFBHomeTopView *)homeTopView didClickHomeTopBtnType:(ZFBHomeTopViewBtnType)btnType andTitle:(NSString *)title{
    
    switch (btnType) {
        case ZFBHomeTopViewBtnTypeScan:
            [self pushChildTitle:title];
            
            break;
        case ZFBHomeTopViewBtnTypePay:
            [self pushChildTitle:title];
            
            break;
        case ZFBHomeTopViewBtnTypeCard:
            [self pushChildTitle:title];
            
            break;
        case ZFBHomeTopViewBtnTypeXiu:
            [self pushChildTitle:title];
            
            break;
            
        default:
            break;
    }
}

- (void)pushChildTitle:(NSString *)title {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    vc.navigationItem.title = title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)loadFunctionListData {
    NSArray *array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"homeAllFunctions.plist" withExtension:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrayM addObject:[ZFBFunctionList functionListWithDict :obj]];
    }];
    return arrayM.copy;
    
}
@end
