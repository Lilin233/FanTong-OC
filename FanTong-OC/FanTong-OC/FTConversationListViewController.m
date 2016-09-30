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
#import "FTConversationTableViewCell.h"
@interface FTConversationListViewController ()
@property (nonatomic, strong)FTConversationViewModel *viewModel;

@end

@implementation FTConversationListViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tableView.contentOffset = CGPointMake(0, CGFLOAT_MAX);
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
            [self.tableView reloadData];
        }
        
    }];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    static NSString *ident = @"conversationCell";
    FTConversationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[FTConversationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}
- (void)configureCell:(FTConversationTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(FTConversationCellViewModel *)viewModel{
    [cell bindViewModel:viewModel];
}

#pragma mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

#pragma mark Custom Accessors


- (void)setOtherid:(NSString *)otherid{
    if (_otherid != otherid) {
        _otherid = otherid;
        [self.viewModel.requestRemoteDataCommand execute:_otherid];
    }
    
}

- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTConversationViewModel alloc]initWithParams:nil];
        _viewModel.shouldRequestRemoteDataOnViewDidLoad = NO;
    }
    return _viewModel;
}
@end
