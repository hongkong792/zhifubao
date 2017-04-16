//
//  ZFBFriendViewController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBFriendViewController.h"
#import "NSArray+Addition.h"
#import "ZFBFriendCell.h"
#import "ZFBChatController.h"

static NSString *cellID = @"frined_cell";
static NSString *friendCircleCellID = @"friendCircle_cell";
@interface ZFBFriendViewController ()
@property (nonatomic, strong) NSArray *friendDatas;
@end

@implementation ZFBFriendViewController


- (instancetype)init
{
   return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendDatas = [NSArray objectListWithPlistName:@"Friends.plist" clsName:@"ZFBFriend"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:friendCircleCellID];
    UINib *nib = [UINib nibWithNibName:@"ZFBFriendCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellID];
    
    self.tableView.rowHeight = [[[nib instantiateWithOwner:nib options:nil] firstObject] bounds].size.height;
    
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? self.friendDatas.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendCircleCellID];
        cell.imageView.image = [UIImage imageNamed:@"APC_timeLineIcon"];
        cell.textLabel.text = @"生活圈";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    ZFBFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.friendData = self
    .friendDatas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 0 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        UIStoryboard *moment = [UIStoryboard storyboardWithName:@"ZFBMoment" bundle:nil];
       UIViewController *vc = [moment instantiateInitialViewController];
        vc.navigationItem.title = @"生活圈";
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        ZFBChatController *chat = [[ZFBChatController alloc] init];
        chat.navigationItem.title = [self.friendDatas[indexPath.row] title];
        [self.navigationController pushViewController:chat animated:YES];
    }
}
@end
