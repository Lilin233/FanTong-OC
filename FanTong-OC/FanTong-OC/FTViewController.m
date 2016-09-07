//
//  FTViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/11.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTViewController.h"
#import "FTViewModel.h"
@interface FTViewController ()

@end

@implementation FTViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    FTViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)]
        subscribeNext:^(id x) {
            @strongify(viewController)
           [viewController bindViewModel];
        }];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.viewModel.willDisappearSignal sendNext:nil];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (instancetype)initWithViewModel:(FTViewModel *)viewModel{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;

}
- (void)bindViewModel{


}
@end
