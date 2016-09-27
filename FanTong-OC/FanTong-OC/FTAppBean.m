//
//  FTAppBean.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTAppBean.h"

@implementation FTAppBean
+ (instancetype)shareInstance{
    static dispatch_once_t once_token;
    static FTAppBean *appBean = nil;
    dispatch_once(&once_token, ^{
        appBean = [[FTAppBean alloc]init];
    });
    return appBean;

}
@end
