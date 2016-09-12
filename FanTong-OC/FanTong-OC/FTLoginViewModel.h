//
//  FTLoginViewModel.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTViewModel.h"

@interface FTLoginViewModel : FTViewModel

/// The avatar URL of the user
@property (nonatomic, strong)NSURL *avatarURL;

/// The username entered by the user
@property (nonatomic, copy)NSString *username;

/// The password entered by the user
@property (nonatomic, copy)NSString *password;

@property (nonatomic, strong)RACSignal *validLoginSignal;

/// The command of the login button
@property (nonatomic, strong)RACCommand *loginCommand;

- (void)loginFanfou;

@end
