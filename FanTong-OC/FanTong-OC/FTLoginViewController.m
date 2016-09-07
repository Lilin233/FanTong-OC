//
//  FTLoginViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/12.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTLoginViewController.h"
#import "FTLoginViewModel.h"
#import <MBProgressHUD/MBProgressHUD.h>
@interface FTLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameLoginButton;
@property (weak, nonatomic) IBOutlet UITextField *passwordLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong)FTLoginViewModel *viewModel;
@end


@implementation FTLoginViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordLoginButton.delegate = self;
    @weakify(self)
    [[self rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple *tuple) {
       @strongify(self)
        if (tuple.first == self.passwordLoginButton) {
            [self.viewModel.loginCommand execute:nil];
        }
    }];
    
}
- (void)awakeFromNib{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)bindViewModel{
    [super bindViewModel];
    @weakify(self)
    RAC(self.viewModel, username) = self.usernameLoginButton.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordLoginButton.rac_textSignal;
    
    [[self.viewModel.loginCommand.executing doNext:^(id x) {
        @strongify(self)
        [self.view endEditing:YES];
    }] subscribeNext:^(NSNumber *executing) {
        @strongify(self)
        if (executing.boolValue) {
            [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES].labelText = @"Logging in...";
        }else{
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        }
    }];

    
//    [[[RACSignal merge:@[self.viewModel.loginCommand.executing] ] doNext:^(id x) {
//        @strongify(self)
//        [self.view endEditing:YES];
//    }] subscribeNext:^(NSNumber *executing) {
//        @strongify(self)
//        if (executing.boolValue) {
//            [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES].labelText = @"Logging in...";
//        }else{
//            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
//        }
//    }];
    
    [self.viewModel.loginCommand.errors subscribeNext:^(NSError *error) {
        NSLog(@"%@", error.description);
    }];
    
    RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
       [self.viewModel.loginCommand execute:nil];
    }];
}
- (FTLoginViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTLoginViewModel alloc]initWithService];
    }
    return _viewModel;
}
@end
