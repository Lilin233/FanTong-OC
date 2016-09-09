//
//  FTLoginViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTLoginViewModel.h"

@implementation FTLoginViewModel

- (void)initialize {
    [super initialize];
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)] reduce:^(NSString *username, NSString *password){
        NSLog(@"username:%@", username);
        NSLog(@"password:%@", password);
        return @(username.length > 0 && password.length > 0);
    }] distinctUntilChanged];
}
@end
