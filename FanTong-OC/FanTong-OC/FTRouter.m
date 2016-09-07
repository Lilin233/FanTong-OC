//
//  FTRouter.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTRouter.h"

#import "FTViewController.h"
#import "FTViewModel.h"
@implementation FTRouter

+ (instancetype)sharedInstance{
    static FTRouter *sharedInstance = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}
- (FTViewController *)viewControllerForViewModel:(FTViewModel *)viewModel{
    return nil;
}
@end
