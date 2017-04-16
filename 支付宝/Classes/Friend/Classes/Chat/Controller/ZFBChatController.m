//
//  ZFBChatController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBChatController.h"
#import "NSArray+Addition.h"
#import "ZFBChat.h"
#import "Masonry.h"
#import "ZFBChatMeCell.h"
#import "ZFBChatOtherCell.h"


static NSString *chatMeCellID = @"chatMe_cell";
static NSString *chatOtherCellID = @"chatOther_cell";

@interface ZFBChatController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *chatData;
@property (nonatomic, strong) NSDictionary *autoreply;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSString *lastTime;
@property (nonatomic, weak) UITextField *textFiled;

@end

@implementation ZFBChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chatData = [self loadChatData];
//    self.lastTime = [[self.chatData lastObject] time];
    
    [self setupUI];
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 44, 0));
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    [tableView registerClass:[ZFBChatMeCell class] forCellReuseIdentifier:chatMeCellID];
    
    [tableView registerClass:[ZFBChatOtherCell class] forCellReuseIdentifier:chatOtherCellID];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.estimatedRowHeight = 60;
    
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *barView = [[UIVisualEffectView alloc] initWithEffect:effect];
    [self.view addSubview:barView];
    
    
    
    UITextField *text = [[UITextField alloc] init];
    text.borderStyle = UITextBorderStyleRoundedRect;
    [barView.contentView addSubview:text];
    text.delegate = self;
    text.returnKeyType = UIReturnKeySend;
    text.enablesReturnKeyAutomatically = YES;
    
    _textFiled = text;
    
    UIButton *send = [UIButton buttonWithType:UIButtonTypeSystem];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    
    [send addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [barView.contentView addSubview:send];
    
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(barView.contentView);
        make.left.offset(8);
//        make.height.offset(30);
        
    }];
    
    [send mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(text.mas_right).offset(8);
        make.centerY.equalTo(barView.contentView);
        make.right.offset(-8);
        
    }];
    
    [barView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.offset(44);
    }];
    
    
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}


- (void)sendBtnClick {
    [self textFieldShouldReturn:self.textFiled];
}
- (void)keyboardWillChangeFrame:(NSNotification *)note {
   CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat transformY = keyboardFrame.origin.y - self.view.bounds.size.height - 64;
    self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (NSMutableArray *)loadChatData {
   NSArray *data = [NSArray objectListWithPlistName:@"messages.plist" clsName:@"ZFBChat"];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithArray:data];
    
    NSString *tempTime = [data[0] time];
    for (NSInteger i = 1; i < data.count; i++) {

        if ([[arrM[i] time] isEqualToString:tempTime]) {
            [arrM[i] setTime:@""];
        } else {
            tempTime = [arrM[i] time];
        }
  
      
    }
    return arrM;
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.chatData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFBChat *chat = self.chatData[indexPath.row];
    
    
    if (chat.type == ZFBChatTypeMe) {
       ZFBChatMeCell *cell = [tableView dequeueReusableCellWithIdentifier:chatMeCellID forIndexPath:indexPath];
        cell.chat = chat;
        return cell;
    } else {
        ZFBChatOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:chatOtherCellID forIndexPath:indexPath];
        cell.chat = chat;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 4;
}


#pragma mark - textField的代理方法,当点击键盘上的return键时调用此方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 自己发送一条消息
    [self sendMessageWithText:textField.text messageType:ZFBChatTypeMe];
    
    // 对方回复一条消息
    NSString *replayText = [self replyWithText:textField.text];
    [self sendMessageWithText:replayText messageType:ZFBChatTypeOther];
    
    // 清空文本框的文字
    textField.text = nil;
    
    return YES;
}

// 传入自己发送的文字来获取自动回复内容
- (NSString *)replyWithText:(NSString *)text {
    // 遍历截取字符串
    for (int i = 0; i < text.length; ++i) {
        NSString *word = [text substringWithRange:NSMakeRange(i, 1)];
        if (self.autoreply[word]) {
            return self.autoreply[word];
        }
    }
    return @"88";
}

// 传入消息内容和消息类型,自己发送一条消息
- (void)sendMessageWithText:(NSString *)text messageType:(ZFBChatType)type {
    // 创建数据模型
    ZFBChat *chat = [[ZFBChat alloc] init];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSString *time = [dateFormatter stringFromDate:date];
    chat.time = time;
    chat.type = type;
    chat.text = text;
    

    
    if ([self.lastTime isEqualToString:chat.time]) {
        chat.time = @"";
    } else {
        self.lastTime = chat.time;
        
    }
    
    
    
   
    [self.chatData addObject:chat];
    
    //    [self.tableV iew reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.chatData.count - 1) inSection:0];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

// 加载自动回复数据
- (NSDictionary *)autoreply {
    if (_autoreply == nil) {
        _autoreply = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoreply.plist" ofType:nil]];
    }
    return _autoreply;
}
@end
