//
//  ZFBBusinessViewController.m
//  001-支付宝口碑
//
//  Created by chao on 16/8/10.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBBusinessViewController.h"
#import "ZFBBusiness.h"
#import "ZFBBusinessCell.h"
#import "ZFBBusinessHeaderView.h"
#import "ZFBBusinessTypeView.h"
#import "ZFBBusinessType.h"


@interface ZFBBusinessViewController ()
@property (nonatomic, strong) NSArray *businessData;
@end

@implementation ZFBBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _businessData = [self loadBusinessData];
    
    [self setupTableViewHeaderView];
    [self setupTableViewFooterView];
    
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
// 2: 3 == 4 : 6

- (void)setupTableViewHeaderView {
    CGFloat tableViewW = self.tableView.bounds.size.width;
    
    ZFBBusinessTypeView *typeView = [[ZFBBusinessTypeView alloc] initWithFrame:CGRectMake(0, 0, tableViewW, tableViewW * 0.5)];
    typeView.typeList = [self loadBusinessTypeData];
    
    
    ZFBBusinessHeaderView *pictureView = [ZFBBusinessHeaderView businesHeaderView];
    
    CGFloat realH = tableViewW / pictureView.bounds.size.width * pictureView.bounds.size.height;
    pictureView.frame = CGRectMake(0, CGRectGetMaxY(typeView.frame), tableViewW, realH);
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableViewW, CGRectGetMaxY(pictureView.frame))];
    
    [headerView addSubview:typeView];
    [headerView addSubview:pictureView];
    
    self.tableView.tableHeaderView = headerView;
}


- (void)setupTableViewFooterView {
    UIButton *loadMordDataBtn = [[UIButton alloc] init];
    [loadMordDataBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    [loadMordDataBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [loadMordDataBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    loadMordDataBtn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    loadMordDataBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    loadMordDataBtn.frame = CGRectMake(0, 0, 0, 30);
    [loadMordDataBtn addTarget:self action:@selector(loadMoreDataBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = loadMordDataBtn;
}

- (void)loadMoreDataBtnClick {
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _businessData.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFBBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"business" forIndexPath:indexPath];
    cell.business = _businessData[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" 热门推荐";
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.layoutMargins = UIEdgeInsetsZero;
}
- (NSArray *)loadBusinessData {
    NSArray *array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"business.plist" withExtension:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrayM addObject:[ZFBBusiness businessWithDict:obj]];
    }];
    return arrayM.copy;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSArray *)loadBusinessTypeData {
    // 1. 加载 plist
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"businessType.plist" withExtension:nil];
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    // 2. 遍历数组，字典转模型
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        [arrayM addObject:[ZFBBusinessType businessTypeWithDict:dict]];
    }
    
    // 3. 返回数组
    return arrayM.copy;
}
@end
