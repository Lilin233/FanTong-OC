//
//  FTConversationListViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTConversationListViewController.h"
#import "FTConversationTableViewCell.h"
#import "FTConversationViewModel.h"
@interface FTConversationListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *conversatonTableView;
@property (nonatomic, strong)FTConversationViewModel *viewModel;
@end

@implementation FTConversationListViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
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
            [self.conversatonTableView reloadData];
        }
        
    }];
    
}

#pragma mark UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cellID";
    FTConversationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FTConversationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.viewModel = self.viewModel.datasource[indexPath.row];
    return cell;
}


#pragma mark Custom Accessors


- (UITableView *)conversatonTableView{
    if (_conversatonTableView == nil) {
        _conversatonTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVICATIONBAR_HEIGHT + STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVICATIONBAR_HEIGHT - STATUSBAR_HEIGHT) style:UITableViewStylePlain];
        _conversatonTableView.delegate = self;
        _conversatonTableView.dataSource = self;
        [self.view addSubview:_conversatonTableView];
    }
    return _conversatonTableView;
}

- (void)setOtherid:(NSString *)otherid{
    if (_otherid != otherid) {
        _otherid = otherid;
        [self.viewModel.requestRemoteDataCommand execute:_otherid];
    }
    
}

- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTConversationViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}
@end
