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
#import <Vertigo/TGRImageViewController.h>
#import <Vertigo/TGRImageZoomAnimationController.h>

@interface FTHomePageViewController ()<UIViewControllerTransitioningDelegate, TimeLineCellDelegate, UITabBarControllerDelegate>
@property (nonatomic, strong)FTHomepageViewModel *viewModel;
@property (nonatomic, strong)UIImageView *currentStatusImageView;
@end


@implementation FTHomePageViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"首页";
    
    self.tabBarController.delegate = self;
    
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
    FTTimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[FTTimelineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}
- (void)configureCell:(FTTimelineTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(FTTimelineCellViewModel *)viewModel{
    cell.cellDelegate = self;
    [cell bindViewModel:viewModel];
}

#pragma mark UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if ([presented isKindOfClass:TGRImageViewController.class]) {
        return [[TGRImageZoomAnimationController alloc] initWithReferenceImageView:_currentStatusImageView];
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if ([dismissed isKindOfClass:TGRImageViewController.class]) {
        return [[TGRImageZoomAnimationController alloc] initWithReferenceImageView:_currentStatusImageView];
    }
    return nil;
}

#pragma mark TimeLineCellDelegate
- (void)statusImageClick:(UIImageView *)imageView{
    if (imageView.image == nil) {
        return;
    }
    _currentStatusImageView = imageView;
    TGRImageViewController *viewController = [[TGRImageViewController alloc] initWithImage:_currentStatusImageView.image];
    viewController.transitioningDelegate = self;
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)statusAvatarClick:(FTTimelineTableViewCell *)cell{

}

#pragma mark Custom Accessors
- (FTViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTHomepageViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}

#pragma mark UITabbarController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}
@end
