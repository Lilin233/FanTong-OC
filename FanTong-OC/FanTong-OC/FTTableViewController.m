//
//  FTTableViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/28.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTTableViewController.h"
#import "FTTableViewModel.h"
#import "CBStoreHouseRefreshControl.h"
#import <SVPullToRefresh/SVPullToRefresh.h>
@interface FTTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)CBStoreHouseRefreshControl *storeHouseRefreshControl;

@end
@implementation FTTableViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.viewModel shouldPullToRefresh]) {
        self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self.tableView target:self refreshAction:@selector(refreshTriggered:) plist:@"storehouse" color:[UIColor blackColor] lineWidth:1.5 dropHeight:100 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];

    }
    
    if ([self.viewModel shouldInfiniteScrolling]) {
    
        @weakify(self)
        [self.tableView addInfiniteScrollingWithActionHandler:^{
            @strongify(self)
            [[[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page + 1)] deliverOnMainThread] subscribeNext:^(id x) {
                self.viewModel.page += 1;
            } error:^(NSError *error) {
                [self.tableView.infiniteScrollingView stopAnimating];
            } completed:^{
                [self.tableView.infiniteScrollingView stopAnimating];
            }];
            
        }];

    }
    

}
- (void)bindViewModel{
    [super bindViewModel];
    @weakify(self)
    
    [[[RACObserve(self.viewModel, datasource)
      distinctUntilChanged]
      deliverOnMainThread]
      subscribeNext:^(id x) {
          @strongify(self)
         [self.tableView reloadData];
        }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma Public
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{}

#pragma mark Private
- (void)refreshTriggered:(id)sender{
    @weakify(self)
    [[[self.viewModel.requestRemoteDataCommand execute:@1] deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        self.viewModel.page = 1;
    } error:^(NSError *error) {
        @strongify(self)
        [self.storeHouseRefreshControl finishingLoading];
    } completed:^{
        @strongify(self)
        [self.storeHouseRefreshControl finishingLoading];
    }];
}

#pragma mark UITableView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}

#pragma mark UITableView Datasourece
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    id object = self.viewModel.datasource[indexPath.row];
    [self configureCell:cell atIndexPath:indexPath withObject:object];
    return cell;
}

#pragma mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FTViewModel *viewModel = self.viewModel.datasource[indexPath.row];
    return viewModel.height;
    
}

#pragma mark Custom Accessors
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBAR_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        [self.view addSubview:_tableView];
    }
    return _tableView;


}
@end
