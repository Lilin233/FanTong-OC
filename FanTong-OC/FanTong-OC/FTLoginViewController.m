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
#import <IQKeyboardManager/IQKeyboardManager.h>
@interface FTLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *landingRainbow;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (nonatomic, strong)FTLoginViewModel *viewModel;
@property (nonatomic, assign)double rainbowAngle;
@end


@implementation FTLoginViewController
@synthesize viewModel = _viewModel;

#pragma mark Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordTextField.delegate = self;
    @weakify(self)
    [[self rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple *tuple) {
       @strongify(self)
        if (tuple.first == self.passwordTextField) {
            [self.viewModel.loginCommand execute:nil];
        }
    }];
    [[self.closeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
    [self configureLoginView];
    
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.shouldResignOnTouchOutside = YES;
    keyboardManager.keyboardDistanceFromTextField = 100;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma Private
- (void)startAnimation{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.rainbowAngle * (M_PI /180.0f));
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.landingRainbow.transform = endAngle;
    } completion:^(BOOL finished) {
        self.rainbowAngle += 15;
        [self startAnimation];
    }];
}

- (void)configureLoginView{
    [self.view sendSubviewToBack:self.landingRainbow];
    [self startAnimation];

    self.usernameTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"账号" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.usernameTextField.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.3];
    self.passwordTextField.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.3];
}

#pragma mark Bind ViewModel
- (void)bindViewModel{
    [super bindViewModel];
    @weakify(self)
    RAC(self.viewModel, username) = self.usernameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    
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
    
    [self.viewModel.loginCommand.errors subscribeNext:^(NSError *error) {
        NSLog(@"%@", error.description);
    }];
    
    RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel.loginCommand execute:nil];
        [self.viewModel loginFanfou];
    }];
}

#pragma mark Custom Accessors
- (FTLoginViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[FTLoginViewModel alloc]initWithParams:nil];
    }
    return _viewModel;
}
@end
