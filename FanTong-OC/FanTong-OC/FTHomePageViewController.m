//
//  FTHomePageViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/11.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTHomePageViewController.h"
#import "FTLoginViewController.h"
#import "FTTimelineTableViewCell.h"
#import "FTHomepageViewModel.h"
#import "CBStoreHouseRefreshControl.h"
#import <SVPullToRefresh/SVPullToRefresh.h>
@interface FTHomePageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *timelineTableView;
@property (nonatomic, strong)FTHomepageViewModel *viewModel;
@property (nonatomic, strong)CBStoreHouseRefreshControl *storeHouseRefreshControl;
@end


@implementation FTHomePageViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"首页";
    
    [self.viewModel.requestRemoteDataCommand execute:nil];
    self.timelineTableView.alwaysBounceVertical = YES;

    self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self.timelineTableView target:self refreshAction:@selector(refreshTriggered:) plist:@"storehouse" color:[UIColor blackColor] lineWidth:1.5 dropHeight:100 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
    
    @weakify(self)
    [self.timelineTableView addPullToRefreshWithActionHandler:^{

    }];
    [self.timelineTableView addInfiniteScrollingWithActionHandler:^{
        @strongify(self)
        [[[self.viewModel.requestRemoteDataCommand execute:self.viewModel.datasource.lastObject] deliverOnMainThread] subscribeNext:^(id x) {
            
        } error:^(NSError *error) {
            [self.timelineTableView.infiniteScrollingView stopAnimating];
        } completed:^{
            [self.timelineTableView.infiniteScrollingView stopAnimating];
        }];
        
    }];
    

    self.timelineTableView.showsPullToRefresh = NO;

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
            [self.timelineTableView reloadData];
        }

    }];

}
- (void)refreshTriggered:(id)sender
{
    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
}

- (void)finishRefreshControl
{
    [self.storeHouseRefreshControl finishingLoading];
}

#pragma mark UITableView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}
#pragma mark UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.datasource.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    FTTimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[FTTimelineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.viewModel = self.viewModel.datasource[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FTTimelineCellViewModel *cellViewModel = self.viewModel.datasource[indexPath.row];
    return cellViewModel.height;

}
#pragma mark Custom Accessors
- (UITableView *)timelineTableView{
    if (_timelineTableView == nil) {
        _timelineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBAR_HEIGHT) style:UITableViewStylePlain];
        _timelineTableView.delegate = self;
        _timelineTableView.dataSource = self;
        _timelineTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        [self.view addSubview:_timelineTableView];
    }
    return _timelineTableView;

}
- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTHomepageViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}
@end
