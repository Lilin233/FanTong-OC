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
@interface FTMessageViewController ()
@property (nonatomic, strong)FTDirectMessageViewModel *viewModel;
@end

@implementation FTMessageViewController
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"消息";
    
    if ([self.viewModel shouldRequestRemoteDataOnViewDidLoad]) {
        [self.viewModel.requestRemoteDataCommand execute:@1];
    }
    
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
    static NSString *ident = @"timelineCell";
    FTMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[FTMessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}
- (void)configureCell:(FTMessageTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(FTDirectMessageCellViewModel *)viewModel{
    [cell bindViewModel:viewModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FTConversationListViewController *vc = [[FTConversationListViewController alloc]init];
    FTDirectMessageCellViewModel *viewModel = self.viewModel.datasource[indexPath.row];
    vc.otherid = viewModel.otherid;
    [self.navigationController pushViewController:vc animated:YES];

}


#pragma mark Custom Accessors
- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTDirectMessageViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}
@end
