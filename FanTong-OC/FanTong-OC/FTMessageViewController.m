//
//  FTMessageViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/11.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTMessageViewController.h"
#import "FTLoginViewController.h"
#import "FTMessageTableViewCell.h"
#import "FTDirectMessageViewModel.h"
#import "FTConversationListViewController.h"
#import "FTConversationViewModel.h"
#import "FTDirectMessageCellViewModel.h"
@interface FTMessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *messageTableView;
@property (nonatomic, strong)FTDirectMessageViewModel *viewModel;
@end

@implementation FTMessageViewController
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"消息";
    [self.viewModel.requestRemoteDataCommand execute:nil];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)bindViewModel{
    [self.viewModel.requestRemoteDataCommand.executing subscribeNext:^(NSNumber *executing) {
        if (executing.boolValue) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES].labelText = MBPROGRESSHUD_LABEL_TEXT;
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.messageTableView reloadData];
        }
        
    }];
    
}

#pragma mark UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cellID";
    FTMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FTMessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.viewModel = self.viewModel.datasource[indexPath.row];
    return cell;
}

#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FTConversationListViewController *conversationListVC = [[FTConversationListViewController alloc]init];
    FTDirectMessageCellViewModel *viewModel = (FTDirectMessageCellViewModel *)self.viewModel.datasource[indexPath.row];
    conversationListVC.otherid = viewModel.otherid;
    [self.navigationController pushViewController:conversationListVC animated:YES];
}

#pragma mark Custom Accessors
- (UITableView *)messageTableView{
    if (_messageTableView == nil) {
        _messageTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVICATIONBAR_HEIGHT + STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVICATIONBAR_HEIGHT - STATUSBAR_HEIGHT- TABBAR_HEIGHT) style:UITableViewStylePlain];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.rowHeight = 60;
        [self.view addSubview:_messageTableView];
    }
    return _messageTableView;
}
- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTDirectMessageViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}
@end
